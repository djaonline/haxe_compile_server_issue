package js.npm.moment;

@:jsRequire('moment')
extern class Moment
{
	@:selfCall static function call(?date: Dynamic): IMoment;
	public static var tz(default, null): Timezone;
	public static function months(): Array<String>;
	public static function weekdays(?format: String): Array<String>;
	public static function weekdaysShort(?localeSorted: Bool): Array<String>;
}