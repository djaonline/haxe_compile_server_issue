package helppy.web.mui.checkbox;

import helppy.core.data.ui.ItemData;
import helppy.web.lang.view.LangLabel;
import helppy.web.mui.hint.PopoverIcon;
import js.html.InputElement;
import mui.common.Color;
import mui.core.Checkbox;
import mui.core.FormControlLabel;
import mui.core.FormGroup;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent;
import react.ReactFragment;
import react.ReactMacro.jsx;
import react.types.SyntheticEvent.ChangeEvent;

using helppy.web.util.CssUtil;

enum abstract CheckboxGroupDirection(Int) 
{
	var Horizontal = 0;
	var Vertical = 1;
}

typedef HintId = (item: ItemData) -> String;

typedef CheckboxGroupProps = 
{
	selectedIds: Array<String>,
	items: Array<ItemData>,
	?disabled: Bool,
	?direction: CheckboxGroupDirection,
	?upperMargins: Bool,
	?getHintId: HintId,
	onSelect: (id: String, selected: Bool) -> Void,
}

class CheckboxGroup extends ReactComponentOfProps<CheckboxGroupProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		controlLabel:
		{
			marginLeft: theme.spacing(-0.5),
			marginRight: theme.spacing(3)
		},
		upperMargins:
		{
			marginTop: theme.spacing(0.8),
			marginBottom: theme.spacing(0.8)
		},
		checkbox:
		{
			padding: theme.spacing(0.25),
			marginRight: theme.spacing(0.5)
		},
		label:
		{
			display: "flex"
		},
		hint:
		{
			marginLeft: theme.spacing(1)
		}
	});
	
	override function render()
	{
		return jsx('<$CheckboxGroupImpl />');
	}

	function CheckboxGroupImpl() 
	{
		final row = switch props.direction
		{
			case CheckboxGroupDirection.Horizontal: true;
			case CheckboxGroupDirection.Vertical: false;
			case _: false;
		};
		return jsx('
			<$FormGroup className=${"".addStyle(props)}
				row=${row}>
				${getItems()}
			</$FormGroup>
		');
	}

	function getItems(): Array<ReactFragment>
	{
		final classes = useStyle();
		var controlClassName = classes.controlLabel;
		if (props.upperMargins) controlClassName += " " + classes.upperMargins;
		return
		[
			for (i in 0...props.items.length) 
			{
				final item = props.items[i];
				final name = 
					if (item.text != null) item.text;
					else if (item.localeItemData != null) item.localeItemData.ru;
					else null;
				jsx('
					<div name=${name}
						key=${item.id}>
						<$FormControlLabel className=${controlClassName}
							name=${name}
							control=${
								jsx('
									<$Checkbox className=${classes.checkbox}
										checked=${props.selectedIds.indexOf(item.id) != -1}
										disabled=${props.disabled}
										color=${Color.Primary}
										onChange=${onSelect.bind(item.id)} />
								')
							}
							label=${
								jsx('
									<div className=${classes.label}>
										<$LangLabel text=${item.text}
											localItemData=${item.localeItemData} />
										${getHint(item)}
									</div>
								')
							} />
					</div>
				');
			}
		];
	}

	function getHint(item: ItemData)
	{
		return if(props.getHintId != null)
		{
			final classes = useStyle();
			final textId = props.getHintId(item);
			textId != null ? jsx('<$PopoverIcon className=${classes.hint} textId=${textId} />') : null;
		}
		else
			null;
	}

	function onSelect(id: String, e: ChangeEvent<InputElement>)
	{
		final checked = e.target.checked;
		props.onSelect(id, checked);
	}
}