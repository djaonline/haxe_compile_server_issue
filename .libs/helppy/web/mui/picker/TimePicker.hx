package helppy.web.mui.picker;

import mui.pickers.TimePicker as MuiTimePicker;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class TimePicker
{
	public static function render(props: PickerProps)
	{
		return jsx('
			<$PickersUtilsProvider>
				<$MuiTimePicker {...props} />
			</$PickersUtilsProvider>
		');
	}
}