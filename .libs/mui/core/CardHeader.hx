package mui.core;

import mui.core.Typography.TypographyProps;

typedef CardHeaderClassProps<T> = 
{
	?root: T,
	?avatar: T,
	?action: T,
	?content: T,
	?title: T,
	?subheader: T
}

typedef CardHeaderProps = ForcedOverride<StandardDOMAttributes, {
	?children: Noise,
	?classes: CardHeaderClassProps<String>,
	?action: ReactFragment,
	?avatar: ReactFragment,
	?component: ReactType,
	?disableTypography: Bool,
	?subheader: ReactFragment,
	?subheaderTypographyProps: Partial<TypographyProps>,
	?title: ReactFragment,
	?titleTypographyProps: Partial<TypographyProps>
}>;

@:jsRequire('@material-ui/core', 'CardHeader')
extern class CardHeader extends ReactComponentOfProps<CardHeaderProps>
{
}

