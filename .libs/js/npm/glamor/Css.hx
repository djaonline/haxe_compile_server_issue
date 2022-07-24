package js.npm.glamor;

typedef StyleAttribute = Dynamic;

typedef CSSProperties = Dynamic;

typedef Rule = haxe.extern.EitherType<CSSProperties, StyleAttribute>;

@:jsRequire('glamor', 'css')
extern class Css 
{
	@:selfCall static function style(style: haxe.extern.Rest<Rule>): StyleAttribute;
}
