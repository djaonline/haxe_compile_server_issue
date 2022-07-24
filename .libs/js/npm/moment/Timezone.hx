package js.npm.moment;

@:jsRequire('moment-timezone')
extern class Timezone
{
	function setDefault(timezone: String): Void;
}