package helppy.web.mui.adornment;

import helppy.web.mui.label.FormLabel;
import mui.core.InputAdornment;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;

enum abstract AdornmentKind(Int) 
{
	var START = 0;
	var END = 1;	
}

typedef AdornmentProps =
{
	?text: String,
	?textId: String,
	?content: Any,
	?kind: AdornmentKind,
	?useForInput: Bool
}

@:jsxStatic('render')
class Adornment 
{
	static final useStyle = makeStyles((theme) ->
	{
		label: 
		{
			display: "inline-block",
			paddingRight: theme.spacing(1)
		}
	});
	
	public static function render(props: AdornmentProps) 
	{
		var result: Any = 
		if (props.content != null)
		{
			props.content;
		}
		else if (props.text != null || props.textId != null)
		{
			final classes = useStyle();
			jsx('
				<$FormLabel className=${classes.label}
					text=${props.text}
					textId=${props.textId}
					variant=${FormLabelVariant.LIGHT_GREY} />
			');
		}
		else 
			null;
		if (result != null && props.useForInput)
		{
			final position = 
			switch props.kind 
			{
				case AdornmentKind.END: 
				{
					InputAdornmentPosition.End;
				}
				default: 
					InputAdornmentPosition.Start;
			}
			result = jsx('
				<$InputAdornment position=${position}>
					${result}
				</$InputAdornment>
			');
		}
		return result;
	}
}