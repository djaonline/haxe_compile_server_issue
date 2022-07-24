package js.npm.date_io;

import js.npm.moment.IMoment;

@:jsRequire('@date-io/moment')
extern class MomentUtils
{
	function getCalendarHeaderText(date: IMoment): Any;
	function getWeekdays(): Array<String>;
	function getYearRange(start: IMoment, end: IMoment): Array<IMoment>;
}