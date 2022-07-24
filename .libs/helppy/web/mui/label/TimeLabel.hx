package helppy.web.mui.label;

import helppy.core.data.DateTime;
import helppy.web.mui.label.FormLabel;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef TimeLabelProps = 
{
	time: DateTime,
	?name: String
}

@:jsxStatic('render')
class TimeLabel
{
	public static function render(props: TimeLabelProps) 
	{
		return 
		{
			jsx('
				<$FormLabel className=${"".addStyle(props)}
					name=${props.name}
					text=${props.time.format("%H:%M")}
					variant=${FormLabelVariant.GREY} />
			');
		}
	}
}