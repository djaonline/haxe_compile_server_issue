package mui.core;

import mui.core.InputBase.InputBaseProps;

typedef OutlinedInputClassProps<T> =
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

typedef OutlinedInputProps = ForcedOverride<InputBaseProps, 
{
	?classes: OutlinedInputClassProps<String>,
	?disableUnderline: Bool
}>;

@:jsRequire('@material-ui/core', 'OutlinedInput')
extern class OutlinedInput extends ReactComponentOfProps<OutlinedInputProps>
{
}

