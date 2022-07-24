package mui.core;

import mui.core.ButtonBase.ButtonBaseProps;

typedef TabClassProps<T> =
{
	?root: T,
	?labelIcon: T,
	?textColorInherit: T,
	?textColorPrimary: T,
	?textColorSecondary: T,
	?selected: T,
	?disabled: T,
	?fullWidth: T,
	?wrapped: T,
	?wrapper: T
}

typedef TabProps = ForcedOverride<ButtonBaseProps, {
	?children: Noise,
	?classes: TabClassProps<String>,
	?disabled: Bool,
	?icon: ReactFragment,
	?label: ReactFragment,
	?value: Any,
	?wrapped: Bool,
}>;

@:jsRequire('@material-ui/core', 'Tab')
extern class Tab extends ReactComponentOfProps<TabProps>
{
}

