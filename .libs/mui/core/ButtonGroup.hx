package mui.core;

import mui.core.Button;

typedef ButtonGroupPropsClassProps<T> =
{
	?root: T,
	?contained: T,
	?focusVisible: T,
	?disableElevation: T,
	?disabled: T,
	?fullWidth: T,
	?vertical: T,
	?grouped: T
}

typedef ButtonGroupProps = 
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: ButtonGroupPropsClassProps<String>,
	?color: Color,
	?disableElevation: Bool,
	?disableFocusRipple: Bool,
	?fullWidth: Bool,
	?startIcon: ReactFragment,
	?size: ButtonSize,
	?variant: ButtonVariant,
	?component: ReactType,
	?disabled: Bool
};

@:jsRequire('@material-ui/core', 'ButtonGroup')
extern class ButtonGroup extends ReactComponentOfProps<ButtonGroupProps>
{
}

