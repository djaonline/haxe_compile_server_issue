package helppy.web.mui.label.error;

import helppy.web.mui.label.AlertLabel;
import mui.lab.Alert;
import react.ReactMacro.jsx;

using LocaleMap;

@:jsxStatic('render')
class ErrorLabel
{
	public static function render(props: AlertLabelProps) 
	{
		return jsx('
			<$AlertLabel {...props}
				color=${AlertColor.Error}
				name=${"error".getText()} />
		');
	}
}