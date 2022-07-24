package lib.core.macros;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
#end

class CompilerOptions 
{
    macro public static function getOption(name:String)
    {
        return Context.makeExpr(Context.definedValue(name), Context.currentPos());
    }
}