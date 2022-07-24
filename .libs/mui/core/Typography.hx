package mui.core;

typedef HeadlineMapping = 
{
	?h1: ReactType,
	?h2: ReactType,
	?h3: ReactType,
	?h4: ReactType,
	?h5: ReactType,
	?h6: ReactType,
	?subtitle1: ReactType,
	?subtitle2: ReactType,
	?display1: ReactType,
	?display2: ReactType,
	?display3: ReactType,
	?display4: ReactType,
	?headline: ReactType,
	?title: ReactType,
	?subheading: ReactType,
	?body1: ReactType,
	?body2: ReactType
}

typedef TypographyVariantMapping = 
{
	?h1: ReactType,
	?h2: ReactType,
	?h3: ReactType,
	?h4: ReactType,
	?h5: ReactType,
	?h6: ReactType,
	?subtitle1: ReactType,
	?subtitle2: ReactType,
	?body1: ReactType,
	?body2: ReactType
}

enum abstract TypographyDisplay(String) 
{
	var Initial = "initial";
	var Block = "block";
	var Inline = "inline";
}

enum abstract TypographyVariant(String) 
{
	var Body1 = "body1";
	var Body2 = "body2";
	var Caption = "caption";
	var Button_ = "button";
	var H1 = "h1";
	var H2 = "h2";
	var H3 = "h3";
	var H4 = "h4";
	var H5 = "h5";
	var H6 = "h6";
	var Subtitle1 = "subtitle1";
	var Subtitle2 = "subtitle2";
	var Overline = "overline";
	var SROnly = "srOnly";
	var Inherit = "inherit";
}

typedef TypographyClassProps<T> =
{
	?root: T,
	?body2: T,
	?body1: T,
	?caption: T,
	?button: T,
	?h1: T,
	?h2: T,
	?h3: T,
	?h4: T,
	?h5: T,
	?h6: T,
	?subTitle1: T,
	?subTitle2: T,
	?overline: T,
	?srOnly: T,
	?alignLeft: T,
	?alignCenter: T,
	?alignRight: T,
	?alignJustify: T,
	?noWrap: T,
	?gutterBottom: T,
	?paragraph: T,
	?colorInherit: T,
	?colorPrimary: T,
	?colorSecondary: T,
	?colorTextPrimary: T,
	?colorTextSecondary: T,
	?colorError: T,
	?displayInline: T,
	?displayBlock: T
}

typedef TypographyProps = 
{
	>StandardDOMAttributes,
	?align: Align,
	?children: ReactFragment,
	?classes: TypographyClassProps<String>,
	?color: TextColor,
	?component: ReactType,
	?display: TypographyDisplay,
	?gutterBottom: Bool,
	?headlineMapping: HeadlineMapping,
	?noWrap: Bool,
	?paragraph: Bool,
	?variant: TypographyVariant,
	?variantMapping: TypographyVariantMapping
};

@:jsRequire('@material-ui/core', 'Typography')
extern class Typography extends ReactComponentOfProps<TypographyProps>
{
}

