package mui.core.styles;

#if !macro
import haxe.extern.EitherType;
import js.Object;
import js.html.StyleElement;
#else
import haxe.macro.Expr;
#end

@:jsRequire('@material-ui/core/styles')
extern class Styles 
{
	@:noCompletion
	@:native('makeStyles')
	static function makeStyles_(objOrFunc: Dynamic): ?Dynamic -> Dynamic;
	
	public static macro inline function makeStyles(objOrFunc: Expr)
	{
		return mui.macro.StylesMacro.makeStyles(objOrFunc);
	} 
#if !macro
	public static function createGenerateClassName(
		options:{?disableGlobal:Bool, ?productionPrefix:String, ?seed:String}
	): GenerateId;


	public static function withStyles<TTheme, TClassesDef>(
		styles: EitherType<TClassesDef, TTheme->TClassesDef>,
		?options: StylesOptions<TTheme>
	): ReactType -> ReactType;

	public static function styled<TTheme>(component:ReactType): (
		styles: EitherType<Properties, {theme: TTheme} -> Properties>,
		?options:StylesOptions<TTheme>
	) -> ReactType;

	
	// Provide the theme object as a property of the input component so it can
	// be used in the render method.
	public static function withTheme(comp: ReactType): ReactType -> ReactType;

	public static inline function mergeJss(jss1: Properties, jss2: Properties): Properties 
	{
		return Object.assign({}, jss1, jss2);
	}

	public static function useTheme<TTheme>(): TTheme;
#end
}

#if !macro
typedef JssCreateStyleSheetOptions = 
{
	var ?media: String;
	var ?meta: String;
	var ?link: Bool;
	var ?element: StyleElement;
	var ?index: Int;
	var ?generateId: GenerateId;
	var ?classNamePrefix: String;
}

typedef StylesOptions<TTheme> = 
{
	>JssCreateStyleSheetOptions,
	var ?defaultTheme: TTheme;
	var ?withTheme: Bool;
	var ?name: String;
	var ?flip: Bool;
}

typedef GenerateId = (rule: Rule, ?sheet: Stylesheet) -> String;
typedef Rule = Dynamic;
typedef Stylesheet = Dynamic;
#end
