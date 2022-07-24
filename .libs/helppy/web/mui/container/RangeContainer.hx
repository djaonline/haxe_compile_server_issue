package helppy.web.mui.container;

import helppy.web.mui.label.FormLabel;
import mui.core.Grid;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef RangeContainerProps = 
{
	fromComp: Any,
	toComp: Any,
	?divider: String,
	?spacing: Int,
	?fromGridWidth: GridsNumber,
	?toGridWidth: GridsNumber,
}

@:jsxStatic('render')
class RangeContainer 
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		divider: 
		{
			margin: theme.spacing(0, -0.25)
		}
	});
	
	public static function render(props: RangeContainerProps) 
	{
		final classes = useStyle(props);
		final divider = props.divider != null ? props.divider : "—";
		final spacing = props.spacing != null ? props.spacing : 2;
		final fromGridWidth = props.fromGridWidth != null ? props.fromGridWidth : True;
		final toGridWidth = props.toGridWidth != null ? props.toGridWidth : True;
		return jsx('
			<$Grid className=${"".addStyle(props)}
				container=${true}
				alignItems=${GridAlignItems.Center}
				alignContent=${GridAlignContent.Center}
				spacing=${spacing}>
				<$Grid item=${true} 
					xs=${fromGridWidth}>
					${props.fromComp}
				</$Grid>
				<$FormLabel className=${classes.divider}
					variant=${FormLabelVariant.GREY}
					text=${divider} />
				<$Grid item=${true} 
					xs=${toGridWidth}>
					${props.toComp}
				</$Grid>
			</$Grid>
		');	
	}	
}