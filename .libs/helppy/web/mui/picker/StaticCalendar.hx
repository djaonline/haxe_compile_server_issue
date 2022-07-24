package helppy.web.mui.picker;

import js.npm.moment.Moment;
import mui.pickers.Calendar as MuiCalendar;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class StaticCalendar
{
	public static function render(props: PickerProps)
	{
		return jsx('
			<$PickersUtilsProvider libInstance=${Moment} utils=${MomentLocalizedUtils}>
				<$MuiCalendar {...props} />
			</$PickersUtilsProvider>
		');
	}
}