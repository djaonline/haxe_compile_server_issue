package helppy.web.mui.picker;

import js.npm.moment.Moment;
import mui.pickers.DatePicker as MuiDatePicker;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class YearPicker
{
	public static function render(props: PickerProps)
	{
		return jsx('
			<$PickersUtilsProvider libInstance=${Moment} utils=${MomentLocalizedUtils}>
				<$MuiDatePicker {...props}
					views=${["year"]}
					format="YYYY" />
			</$PickersUtilsProvider>
		');
	}
}