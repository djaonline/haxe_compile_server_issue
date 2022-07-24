package js.npm.sanitize;

import haxe.Constraints.Function;

@:jsRequire("sanitize-html")
extern class SanitizeHtml 
{
	@:selfCall static function sanitize(html: String, ?opts: SanitizeHtmlOpts): String;
}

extern typedef SanitizeHtmlOpts = 
{
	?allowedTags: Array<String>,
	?allowedAttributes: Dynamic,
	?selfClosing: Array<String>,
	// URL schemes we permit
	?allowedSchemes: Array<String>,
	?allowedSchemesByTag: Dynamic,
	?allowedSchemesAppliedToAttributes: Array<String>,
	?allowProtocolRelative: Bool,
	?parser: Dynamic,
	?transformTags: Dynamic,
	?exclusiveFilter: Function
}