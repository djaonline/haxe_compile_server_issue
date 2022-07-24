package helppy.web.mui.btn;

import helppy.core.data.ui.ItemData;
import helppy.web.lang.view.LangLabel;
import mui.common.Color;
import mui.core.Button;
import mui.core.ButtonGroup;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent;
import react.ReactFragment;
import react.ReactMacro.jsx;
using helppy.web.util.CssUtil;

typedef ToggleButtonProps = 
{
	value: String,
	items: Array<ItemData>,
	?name: String,
	?disabled: Bool,
	onChange: (id: String) -> Void
}

class ToggleButton extends ReactComponentOfProps<ToggleButtonProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		selectedButton:
		{
			backgroundColor: theme.palette.primary.main,
			color: theme.palette.common.white,
			'&:hover':
			{
				backgroundColor: theme.palette.primary.dark,
				color: theme.palette.common.white
			},
			'&:disabled':
			{
				color: theme.palette.common.white
			}
		}
	});

	override function render() 
	{
		return jsx('
			<$ButtonGroup className=${"".addStyle(props)}
				color=${Color.Primary}
				size=${ButtonSize.Small}
				name=${props.name}
				disabled=${props.disabled}
				fullWidth=${true}>
				<$Buttons />
			</$ButtonGroup>
		');
	}

	function Buttons(componentProps: Dynamic): Array<ReactFragment>
	{
		final classes = useStyle();
		return
		[
			for (i in 0...props.items.length) 
			{
				final item = props.items[i];
				final selected = item.id == props.value;
				final className = selected ? classes.selectedButton : "";
				jsx('
					<$Button {...componentProps}
						className=${className.addStyle(componentProps)}
						name=${item.name}
						key=${item.id}
						data-selected=${selected}
						onClick=${props.onChange.bind(item.id)}>
						<$LangLabel textId=${item.textId}
							text=${item.text}
							localItemData=${item.localeItemData} />
					</$Button>
				');
			}
		];
	}
}