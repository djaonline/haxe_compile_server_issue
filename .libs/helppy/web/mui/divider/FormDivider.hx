package helppy.web.mui.divider;

import mui.common.Orientation;
import mui.core.Divider;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;

typedef FormDividerProps =
{
	vertical: Bool
}

@:jsxStatic('render')
class FormDivider
{
	static final useStyle = makeStyles(
	{
		horizontal: 
		{
			marginTop: "8px"
		},
		vertical:
		{
			marginTop: 0,
			marginLeft: "auto",
			marginRight: "auto"
		}
	});
		
	public static function render(props: FormDividerProps) 
	{
		final classes = useStyle();
		return jsx('
			<$Divider className=${props.vertical ? classes.vertical : classes.horizontal}
				orientation=${props.vertical ? Orientation.Vertical : Orientation.Horizontal} />
		');
	}
}