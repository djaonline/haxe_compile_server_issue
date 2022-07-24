package helppy.web.mui.btn;

import css.JustifyContent;
import mui.core.Box;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.React;
import react.ReactMacro.jsx;

typedef ButtonContainerProps = 
{
	children: Any
}

typedef ContainerButtonProps = 
{
	// yeah, all letters are small to prevent react warnings 
	?skipaftermargin: SkipAfterMargin
}

enum abstract SkipAfterMargin(String) 
{
	var TRUE = "true";
	var FALSE = "false";
}

@:jsxStatic('render')
class ButtonContainer 
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		container: 
		{
			display: 'flex',
			justifyContent: JustifyContent.Center,
			margin: theme.spacing(1.5, 6)
		},
		button:
		{
			marginRight: theme.spacing(1)
		}
	});
	
	public static function render(props: ButtonContainerProps) 
	{
		final classes = useStyle();
		final clonedButtons = React.Children.map(props.children, child -> {
			if (child == null) return null;
			final attrs = child.props.skipaftermargin != TRUE ? { className: classes.button } : null;
			return React.cloneElement(child, attrs);
		});
		return jsx('
			<$Box className=${classes.container}>
				${clonedButtons}
			</$Box>
		');
	}
}
