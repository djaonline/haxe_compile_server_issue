package helppy.web.mui.picker;

import mui.pickers.DatePicker as MuiDatePicker;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class DatePicker
{
	public static function render(props: PickerProps)
	{
		final format = props.format == null ? "DD.MM.YYYY" : props.format;
		return jsx('
			<$PickersUtilsProvider>
				<$MuiDatePicker {...props} format=${format} />
			</$PickersUtilsProvider>
		');
	}
}