package js.npm.moment;

import js.lib.Date as JsDate;

extern interface IMoment 
{
	public function format(?format: String): String;
	public function add(amount: Float, unit: UnitTime): IMoment;
	public function month(): Int;
	public function toDate(): JsDate;
}