package mui.icons;

typedef IconProps = 
{
	>DOMAttributes<DOMElement>,
	>IconBaseProps,
}

typedef IconBaseProps = 
{
	var ?component: ReactType;
	var ?color: IconColor;
	var ?fontSize: SvgIconFontSize;
}

enum abstract SvgIconFontSize(String) 
{
	var Default = "default";
	var Inherit = "inherit";
	var Small = "small";
	var Large = "large";
}
