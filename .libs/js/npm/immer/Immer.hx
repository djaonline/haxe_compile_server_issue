package js.npm.immer;

@:jsRequire('immer')
extern class Immer 
{
	public static function produce<T>(state: T, producer: T -> Void): T;
}