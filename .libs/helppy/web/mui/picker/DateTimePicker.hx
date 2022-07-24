package helppy.web.mui.picker;

import js.npm.date_io.MomentUtils;
import mui.pickers.DateTimePicker as MuiDateTimePicker;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class DateTimePicker
{
	public static function render(props: PickerProps)
	{
		final format = props.format == null ? "DD.MM.YYYY HH:mm" : props.format;
		return jsx('
			<$PickersUtilsProvider>
				<$MuiDateTimePicker {...props} format=${format} />
			</$PickersUtilsProvider>
		');
	}
}