package lib.core.event;

#if macro

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.PosInfos;
import sys.io.File;

#end

class SignalSlot<T> 
{
	public var f: T;
	public var once: Bool;
	
	public function new(f : T, once : Bool) 
	{
		this.f	= f;
		this.once = once;
	}
}

class SignalList<T> 
{
	public var slots(default, null)	: Array<SignalSlot<T>>;
	@:noCompletion
	public var _stopped	: Bool;
	
	public function new() 
	{
		slots = new Array();
		_stopped = false;
	}
	
	public function add( o : T, once = false ) 
	{
		slots.push( new SignalSlot<T>( o, once ) );
	}
	
	public function remove( o : T ) 
	{
		var i = 0;
		while ( i < slots.length )
			if ( Reflect.compareMethods( slots[ i ].f, o ) )
				slots.splice( i, 1 );
			else
				i++;
	}
	
	public function exists( o : T ) 
	{
		for ( i in 0...slots.length )
			if ( Reflect.compareMethods( slots[ i ].f, o ) )
				return true;
		return false;
	}
	
	public function clear()
	{
		slots = new Array();
	}
	
	public function stopPropagation() 
	{
		_stopped = true;
	}
	
	public function iterator()
	{
		return slots.iterator();
	}
		
	macro public function dispatch( ethis, args : Array<Expr> ) 
	{
		var pos	= Context.currentPos();
		
		var callerType	= Context.typeExpr( ethis );
		var callerObj	= null;
		var	caller		= null;
		
		switch( callerType.expr ) 
		{
			case TField(e, f)	:
				 callerObj	= e;
				switch( f ) 
				{
					case FStatic(_, ee), FInstance(_,_, ee), FAnon(ee)	:
						caller	= ee;
					default	:	throw "case not matched";
				}
			default	:	throw "case not matched";
		}
		
		var fullObj	= EField( Context.getTypedExpr( callerObj ), caller.toString() );
		var slots	= { expr : EField( { expr : fullObj, pos : pos }, "slots" ), pos : pos };
		var stopped	= { expr : EField( { expr : fullObj, pos : pos }, "_stopped" ), pos : pos };
		
		// build expressions
		var call 	= {
			expr	: ECall( {
				expr	: (macro f.f).expr,
				pos		: Context.currentPos()
			}, args ),
			pos		: Context.currentPos()
		}
		
		// write inline expression
		return macro {
			var i = 0;
			while ( i < $slots.length ) {
				var f = $slots[ i ];
				$call;
				if ( f.once )
					$slots.splice( i, 1 );
				else
					i++;
				if ( $ethis._stopped ) {
					$ethis._stopped = false;
					break;
				}
			}
		};
	}
	
	public function toString() 
	{
		return '[object SignalList: ${slots.length} listener${if (slots.length == 0 || slots.length > 1 ) "s" else ""}]';
	}
}