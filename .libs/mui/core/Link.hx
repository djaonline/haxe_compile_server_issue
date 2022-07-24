package mui.core;

import mui.core.Typography.TypographyClassProps;
import mui.core.Typography.TypographyProps;

enum abstract LinkType(String) to String 
{
	var Alternate = "alternate";
	var Author = "author";
	var Bookmark = "bookmark";
	var Canonical = "canonical";
	var DnsPrefetch = "dns-prefetch";
	var External = "external";
	var Help = "help";
	var Icon = "icon";
	var Import = "import";
	var License = "license";
	var Manifest = "manifest";
	var ModulePreload = "modulepreload";
	var Next = "next";
	var NoFollow = "nofollow";
	var NoOpener = "noopener";
	var NoReferrer = "noreferrer";
	var Opener = "opener";
	var Pingback = "pingback";
	var Preconnect = "preconnect";
	var Prefetch = "prefetch";
	var Preload = "preload";
	var Prerender = "prerender";
	var Prev = "prev";
	var Search = "search";
	var Shortlink = "shortlink";
	var Stylesheet = "stylesheet";
	var Tag = "tag";

	@:from
	static function fromArray(arr:Array<LinkType>): LinkType 
	{
		return cast arr.join(" ");
	}
}

enum abstract LinkTarget(String) to String 
{
	var Self = "_self";
	var Blank = "_blank";
	var Parent = "_parent";
	var Top = "_top";
}

enum abstract LinkUnderline(String) to String 
{
	var None = "none";
	var Hover = "hover";
	var Always = "always";
}

typedef LinkClassProps<T> = 
{
	?root: T,
	?underlineNone: T,
	?underlineHover: T,
	?underlineAlways: T,
	?button: T,
	?focusVisible: T
}

typedef LinkProps = ForcedOverride<TypographyProps, 
{
	children: ReactFragment, 
	?classes: LinkClassProps<String>,
	?target: LinkTarget,
	?rel: LinkType,
	?TypographyClasses: TypographyClassProps<String>,
	?underline: LinkUnderline,
}>;

@:jsRequire('@material-ui/core', 'Link')
extern class Link extends ReactComponentOfProps<LinkProps>
{
}

