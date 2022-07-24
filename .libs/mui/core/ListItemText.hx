package mui.core;

import mui.core.Typography.TypographyProps;

typedef ListItemTextClassProps<T> =
{
	?root: T,
	?multiline: T,
	?dense: T,
	?inset: T,
	?primary: T,
	?secondary: T
}

typedef ListItemTextProps =
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: ListItemTextClassProps<String>,
	?disableTypography: Bool,
	?inset: Bool,
	?primary: ReactFragment,
	?primaryTypographyProps: Partial<TypographyProps>,
	?secondary: ReactFragment,
	?secondaryTypographyProps: Partial<TypographyProps>
};


@:jsRequire('@material-ui/core', 'ListItemText')
extern class ListItemText extends ReactComponentOfProps<ListItemTextProps>
{
}

