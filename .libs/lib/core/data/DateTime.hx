package lib.core.data;

import Date as HaxeDate;
import js.lib.Date as JsDate;

using DateTools;

abstract DateTime(String) 
{
	public static function createDate(day: Int, month: Int, year: Int): DateTime
	{
		return new DateTime(new JsDate(year, month, day));
	}
	
	public static function fromString(str: String): DateTime
	{
		return new DateTime(new JsDate(str));
	}

	public static function fromTimestamp(time: Float): DateTime
	{
		return new DateTime(new JsDate(time));
	}

	public static function fromHaxeDate(date: HaxeDate): DateTime 
	{
		return new DateTime(JsDate.fromHaxeDate(date));
	}

	public static function fromTime(hours: Int, minutes: Int): DateTime
	{
		final date = new JsDate();
		date.setHours(hours);
		date.setMinutes(minutes);
		return new DateTime(date);
	}

	public inline function new(jsDate: JsDate)
	{
		this = 
			try
			{
				jsDate.toISOString();
			}
			catch(err: Dynamic)
			{
				"Invalid Date";
			}
	}

	public static function now(): DateTime
	{
		return new DateTime(new JsDate());
	}

	@:to
	public function toHaxeDate(): HaxeDate
	{
		return JsDate.toHaxeDate(new JsDate(this));
	}

	@:to
	public function toJsDate(): JsDate
	{
		return new JsDate(this);
	}

	public function toTimestamp(): Float
	{
		return toJsDate().getTime();
	}
	
	// compatible with the 'strftime' standard format, e.g. "%Y-%m-%d_%H:%M:%S"
	public function format(strftimeFormat: String): String
	{
		return toHaxeDate().format(strftimeFormat);
	}

	public function isValid(): Bool
	{
		return this != "Invalid Date";
	}

	public function isToday(): Bool
	{
		final today = new JsDate();
		final self = toJsDate();
		return today.getFullYear() == self.getFullYear() &&
			today.getMonth() == self.getMonth() &&
			today.getDate() == self.getDate();
	}

	public function isPast(): Bool
	{
		return toJsDate().getTime() < new JsDate().getTime();
	}

	public function isDateMonthCurrent()
	{
		final today = new JsDate();
		final self = toJsDate();
		return today.getFullYear() == self.getFullYear() &&
			today.getMonth() == self.getMonth();
	}

	public function later(dateTime: DateTime): Bool
	{
		final self = toJsDate();
		final target = dateTime.toJsDate();
		return self.getTime() > target.getTime();
	}

	public function equal(dateTime: DateTime): Bool
	{
		final self = toJsDate();
		final target = dateTime.toJsDate();
		return self.getTime() == target.getTime();
	}

	public function equalTime(time: DateTime): Bool
	{
		final self = toJsDate();
		final target = time.toJsDate();
		return self.getHours() == target.getHours() &&
			self.getMinutes() == target.getMinutes();
	}

	public function equalDate(date: DateTime): Bool
	{
		final self = toJsDate();
		final target = date.toJsDate();
		return self.getDate() == target.getDate() &&
			self.getMonth() == target.getMonth() &&
			self.getFullYear() == target.getFullYear();
	}
}