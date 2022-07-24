package helppy.web.mui.menu;

import helppy.web.mui.hint.HintIcon;
import js.html.Element;
import mui.common.Position;
import mui.core.Menu;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.PureComponent;
import react.React;
import react.ReactComponent.ReactElement;
import react.ReactFragment;
import react.types.SyntheticEvent.MouseEvent;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

enum abstract ToolbarMenuVariant(String) 
{
	var PRIMARY = "primary";
}

typedef ToolbarMenuProps = 
{
	iconBtn: ReactFragment,
	menuItems: Array<ReactElement>,
	?title: ReactFragment,
	?name: String,
	?variant: ToolbarMenuVariant,
	?hintTextId: String
}

typedef ToolbarMenuState = 
{
	open: Bool,
}

class ToolbarMenu extends PureComponentOfPropsAndState<ToolbarMenuProps, ToolbarMenuState>
{
	var _anchorEl: Element;

	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		primary:
		{
			color: theme.palette.primary.main,
			'&:hover':
			{
				backgroundColor: theme.palette.secondary.main
			}
		}
	});
	
	public function new(props) 
	{
		super(props);
		state = { open: false };
	}

	public function close()
	{
		setState( { open: false });
	}
	
	override function render() 
	{
		return jsx('<$ToolbarMenuImpl />');
	}

	function ToolbarMenuImpl()
	{
		final classes = useStyle();
		final iconBtn = React.cloneElement(props.iconBtn, { onClick: onIconBtnClick });
		final menuItems = switch props.variant
		{
			case ToolbarMenuVariant.PRIMARY:
			{
				[
					for (i in 0...props.menuItems.length) 
					{
						React.cloneElement(props.menuItems[i], { className: classes.primary });
					}
				];
			}
			case _: props.menuItems;
		};
		final btnName = props.name;
		final menuName = btnName != null ? 'Меню - ${btnName}' : null;
		return jsx('	
			<div className=${"".addStyle(props)}
				name=${btnName}>
				<$HintIcon textId=${props.hintTextId}>
					${iconBtn}
				</$HintIcon>
				<$Menu name=${menuName}
					anchorEl=${_anchorEl}
					anchorOrigin=${{
						vertical: VerticalPosition.Top,
						horizontal: HorizontalPosition.Right
					}}
					keepMounted=${true}
					transformOrigin=${{
						vertical: VerticalPosition.Top,
						horizontal: HorizontalPosition.Right
					}}
					open=${state.open}
					onClose=${onMenuClose}>
					${props.title}
					${menuItems}
				</$Menu>
			</div>
		');
	}

	function onIconBtnClick(e: MouseEvent<Element>) 
	{
		_anchorEl = e.currentTarget;
		setState({ open: true });
	}

	function onMenuClose() 
	{
		setState( { open: false });
	}
}