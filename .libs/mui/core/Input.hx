package mui.core;

import mui.core.InputBase.InputBaseProps;

typedef InputClassProps<T> =
{
	?root: T,
	?formControl: T,
	?focused: T,
	?disabled: T,
	?colorSecondary: T,
	?underline: T,
	?error: T,
	?marginDense: T,
	?multiline: T,
	?fullWidth: T,
	?input: T,
	?inputMarginDense: T,
	?inputMultiline: T,
	?inputTypeSearch: T
}

typedef InputProps = ForcedOverride<InputBaseProps, 
{
	?classes: InputClassProps<String>,
	?disableUnderline: Bool
}>;

@:jsRequire('@material-ui/core', 'Input')
extern class Input extends ReactComponentOfProps<InputProps>
{
}

