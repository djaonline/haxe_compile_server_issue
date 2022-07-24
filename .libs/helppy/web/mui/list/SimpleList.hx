package helppy.web.mui.list;

import css.FlexWrap;
import css.Overflow;
import css.Position;
import helppy.core.data.ui.ItemData;
import helppy.core.lang.Language;
import helppy.web.lang.view.LangLabel;
import helppy.web.mui.label.FormLabel;
import js.html.InputElement;
import mui.common.Color;
import mui.core.Checkbox;
import mui.core.FormControl.FormControlSize;
import mui.core.FormControlLabel;
import mui.core.FormGroup;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.PureComponent;
import react.ReactFragment;
import react.ReactMacro.jsx;
import react.types.SyntheticEvent.ChangeEvent;

using helppy.core.lang.LangManager;
using helppy.web.util.CssUtil;

typedef SimpleListProps = 
{
	items: Array<ItemData>,
	?selectedIds: Array<String>,
	?disabledIds: Array<String>,
	?selectable: Bool,
	?selectAll: Bool,
	?showSelectAllItem: Bool,
	?disabled: Bool,
	?height: String,
	?messageTextId: String,
	onSelect: (id: String, selected: Bool) -> Void,
	onSelectAll: (selected: Bool) -> Void,
}

class SimpleList extends PureComponentOfProps<SimpleListProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		container:
		{
			position: Position.Relative
		},
		group:
		{
			backgroundColor: theme.palette.common.white,
			height: untyped props -> props.height,
			flexWrap: FlexWrap.NoWrap,
			boxShadow: '0px 2px 2px rgb(0 0 0 / 14%)',
			borderRadius: theme.spacing(0.5),
			overflowY: Overflow.Auto,
			position: Position.Relative
		},
		checkbox:
		{
			padding: theme.spacing(0),
			marginRight: theme.spacing(1)
		},
		headerControlLabel:
		{
			position: Position.Sticky,
			top: 0,
			zIndex: 2
		},
		headerText:
		{
			fontWeight: theme.typography.fontWeightMedium
		},
		baseContainerLabel:
		{
			height: '25px',
			borderBottom: '1px solid ${theme.palette.grey._100}',
			padding: theme.spacing(0.25, 2),
			cursor: untyped props -> !props.selectable ? 'default' : null
		},
		containerLabel:
		{
			backgroundColor: theme.palette.common.white,
		},
		containerLabelHighlight:
		{
			backgroundColor: theme.palette.secondary.main
		},
		controlLabel:
		{
			width: "100%",
			marginLeft: 0,
			marginRight: 0,
		},
		message:
		{
			position: Position.Absolute,
			top: "50%",
			left: "50%",
			transform: "translate(-50%, -50%)"
		}
	});
	
	override function render()
	{
		return jsx('<$SimpleListImpl />');
	}

	function SimpleListImpl() 
	{
		final classes = useStyle(props);
		return jsx('
			<div className=${classes.container.addStyle(props)}>
				<$FormGroup className=${classes.group.addStyle(props)}>
					${getItemSelectAll()}
					${getItems()}
				</$FormGroup>
				<$Message />
			</div>
		');
	}

	function Message()
	{
		final classes = useStyle(props);
		return if (props.messageTextId != null)
		{
			jsx('
				<$FormLabel className=${classes.message}
					textId=${props.messageTextId}
					variant=${FormLabelVariant.LIGHT_GREY} />
			');
		}
		else
			null;
	}

	function getItems(): Array<ReactFragment>
	{
		final classes = useStyle(props);
		return
		[
			for (item in props.items) 
			{
				final checked = props.selectedIds.indexOf(item.id) != -1;
				final disabled = props.disabledIds != null ? props.disabledIds.indexOf(item.id) != -1 : false;
				final containerClassName = classes.baseContainerLabel + " " + (checked ? classes.containerLabelHighlight : classes.containerLabel);
				jsx('
					<div className=${containerClassName}
						key=${item.id}
						name=${getItemName(item)}>
						<$FormControlLabel className=${classes.controlLabel}
							disabled=${disabled}
							control=${
								props.selectable ? jsx('
									<$Checkbox className=${classes.checkbox}
										checked=${props.selectedIds.indexOf(item.id) != -1}
										disabled=${props.disabled}
										color=${Color.Primary}
										size=${FormControlSize.Small}
										onChange=${onSelect.bind(item.id)} />
								')
								: jsx('<div />')
							}
							label=${
								jsx('
									<$LangLabel text=${item.text}
										localItemData=${item.localeItemData} />
								')
							} />
					</div>
				');
			}
		];
	}

	function getItemSelectAll(): ReactFragment
	{
		return if (props.selectable && props.showSelectAllItem)
		{
			final classes = useStyle(props);
			final checked = props.selectAll;
			final containerClassName = classes.headerControlLabel + " " + classes.baseContainerLabel + " " + (checked ? classes.containerLabelHighlight : classes.containerLabel);
			jsx('
				<div className=${containerClassName}
					name=${"selectAll".getTextByLanguage(Language.RU)}>
					<$FormControlLabel className=${classes.controlLabel}
						control=${
							jsx('
								<$Checkbox className=${classes.checkbox}
									checked=${checked}
									disabled=${props.disabled}
									color=${Color.Primary}
									size=${FormControlSize.Small}
									onChange=${onSelectAll} />
							')
						}
						label=${
							jsx('
								<$LangLabel className=${classes.headerText} 
									textId="selectAll" />
							')
						} />
				</div>
			');
		}
		else
		{
			null;
		};
	}

	function getItemName(item: ItemData): String
	{
		return 'Элемент ${item.getName()}';
	}

	function onSelect(id: String, e: ChangeEvent<InputElement>)
	{
		final checked = e.target.checked;
		props.onSelect(id, checked);
	}

	function onSelectAll(e: ChangeEvent<InputElement>)
	{
		props.onSelectAll(e.target.checked);
	}
}