package helppy.web.mui.picker;

import app.main.theme.ColorPallete;
import helppy.core.data.DateTime;
import js.npm.date_io.MomentUtils;
import js.npm.moment.IMoment;
import js.npm.moment.Moment;
import react.ReactMacro.jsx;

class MomentLocalizedUtils extends MomentUtils
{
	final moment = Moment;

	override function getCalendarHeaderText(date: IMoment): Any
	{
		final isDateMonthCurrent = new DateTime(date.toDate()).isDateMonthCurrent();
		final month = date.format("MMMM");
		return jsx('
			<span style=${{ color: isDateMonthCurrent ? ColorPallete.PRIMARY : ColorPallete.GREY_700 }}>
				${month}
			</span>
		');
	}

	override function getWeekdays(): Array<String>
	{
		return Moment.weekdaysShort(true);
	}

	override function getYearRange(start: IMoment, end: IMoment): Array<IMoment>
	{
		final years = super.getYearRange(start, end);
		years.reverse();
		return years;
	}
}