package mui.core;

import mui.core.FormControl.FormControlMarginDense;
import mui.core.FormControl.FormControlVariant;

typedef FormHelperTextClassProps<T> =
{
	root: T,
	error: T,
	disabled: T,
	marginDense: T,
	contained: T,
	focused: T,
	filled: T,
	required: T
}

typedef FormHelperTextProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: FormHelperTextClassProps<String>,
	?component: ReactType,
	?disabled: Bool,
	?error: Bool,
	?filled: Bool,
	?focused: Bool,
	?margin: FormControlMarginDense,
	?required: Bool,
	?variant: FormControlVariant
}

@:jsRequire('@material-ui/core', 'FormHelperText')
extern class FormHelperText extends ReactComponentOfProps<FormHelperTextProps>
{
}

