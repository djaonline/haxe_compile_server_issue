package helppy.web.util;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.io.File;
import haxe.Json;
import lib.core.macros.CompilerOptions;
#end

class CssUtil 
{
	/* 
	* utility function for adding unique namespace to css class, 
	* e.g. '.container' becomes '.package_ComponentClass-contaner'
	*/
	
	macro static public function withPrefix(cssClass: String): ExprOf<String> 
	{
        var fullPath = Context.getLocalClass().toString();
		var r = ~/\./g;
		fullPath = r.replace(fullPath, "_");
		return macro $v{'${fullPath}_${cssClass}'};
    }
	
	/* 
	* utility function for ability to add style from 
	* component property 'className'
	*/
#if !macro
	public static function addStyle(cssClass: String, props: Dynamic)
	{
		if (props != null && props.className != null)
		{
			var classDivider = cssClass != "" ? " " : "";
			return cssClass + classDivider + props.className; 
		}
		else
		{
			return cssClass;
		}
	}
#end
	macro public static function getCssVar(name: String): ExprOf<Dynamic> 
	{
     	if (Context.defined('display')) 
		{
			return Context.makeExpr("", Context.currentPos());
		}
		var style: String = Context.definedValue("style");
		if (style != null)
		{
			if (style.toUpperCase() != "NONE")
			{
				var varPath = 'styles/${style}/variables.json';
				var p = Context.resolvePath(varPath);
				var s = File.getContent(p);
				var obj = Json.parse(s);
				var value = Reflect.field(obj, name);
				if (value == null)
				{
					return Context.error('There is no such css var: $name', Context.currentPos());
				}
				return Context.makeExpr(value, Context.currentPos());
			}
			else
			{
				return Context.makeExpr("", Context.currentPos());
			}
		}
		else
		{
			return Context.error('`style` compile flag isn`t defined', Context.currentPos());
		}
    }
}
