package mui.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.Tools;

class StylesMacro 
{
#if macro
	public static function makeStyles(objOrFunc: Expr): Expr 
	{
		var objStyles = objOrFunc;
		var funcType = checkFunctionType(objOrFunc);
		if (funcType != null)
		{
			objStyles = extractReturnExpr(funcType.expr);
		}
		var fields = extractFields(objStyles);
		for (field in fields)
		{
			typeField(field);
		}
		var newFields = [];
		for (field in fields)
		{
			var field: ObjectField = 
			{
				field: field.field, 
				expr: 
				{
					expr: EConst(CString("", DoubleQuotes)), 
					pos: field.expr.pos
				}
			};
			newFields.push(field);
		}
		var objExpr = {expr: EObjectDecl(newFields), pos: objOrFunc.pos};
		var objType = Context.typeof(objExpr).toComplexType();
		var arg = TOptional(macro :Dynamic);
		var returnType = TFunction([arg], objType);
		return macro 
		{ 
			(mui.core.styles.Styles.makeStyles_($objOrFunc) : $returnType);
		};
	}
		
	static function extractFields(expr: Expr): Array<ObjectField> 
	{
		var resFields = null;
		switch (expr.expr) 
		{
			case EObjectDecl(fields):
			{
				resFields = fields;
			}
			case EBlock([]):
			{
				Context.error('Object should not be empty', expr.pos);
			}
			default:
			{
				Context.error('Expected an inline object declaration', expr.pos);
			}
		}
		return resFields;
	} 
	
	static function typeField(field: ObjectField)
	{
		field.expr = 
		{
			expr: ECheckType(field.expr, macro :css.Properties),
			pos: field.expr.pos
		};
	}

	static function checkFunctionType(expr: Expr): Function
	{
		return switch (expr.expr) 
		{
			case EFunction(kind, f): f;
			default: null;
		}
	}
	
	static function extractReturnExpr(expr: Expr): Expr
	{
		return switch expr.expr
		{
			case EReturn(e): e;
			case EMeta(s, e): extractReturnExpr(e);
			default: Context.error('This function should not have body', expr.pos);
		}
	}
#end
}
