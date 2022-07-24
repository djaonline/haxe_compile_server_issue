package js.npm.cookie;

@:jsRequire("js-cookie")
extern class Cookie 
{
	public static function set(name: String, value: String, ?opt: Dynamic): Void;
	public static function get(?name: String): Dynamic;
	public static function remove(name: String, ?opt: Dynamic): Void;
}