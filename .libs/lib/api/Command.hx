package lib.api;

abstract Command<TInData, TOutData>(String) from String to String 
{
	@:op(A == B) static function equal<TInData, TOutData>( a:Command<TInData, TOutData>, b:Command<TInData, TOutData>) : Bool;	
	@:op(A != B) static function notEqual<TInData, TOutData>( a:Command<TInData, TOutData>, b:Command<TInData, TOutData>) : Bool;
}