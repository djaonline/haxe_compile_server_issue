package mui.core;

import mui.core.FormControl.FormControlMarginDense;
import mui.core.FormControl.FormControlVariant;
import mui.core.FormLabel.FormLabelProps;
import mui.core.FormLabel.FormLabelClassProps;

typedef InputLabelClassProps<T> =
{
	?root: T,
	?focused: T,
	?disabled: T,
	?error: T,
	?required: T,
	?asterisk: T,
	?formControl: T,
	?marginDense: T,
	?shrink: T,
	?animated: T,
	?filled: T,
	?outlined: T
}

typedef InputLabelProps = ForcedOverride<FormLabelProps, 
{
	?classes: InputLabelClassProps<String>,
	?disableAnimation: Bool,
	?FormLabelClasses: FormLabelClassProps<String>,
	?margin: FormControlMarginDense,
	?shrink: Bool,
	?variant: FormControlVariant
}>;

@:jsRequire('@material-ui/core', 'InputLabel')
extern class InputLabel extends ReactComponentOfProps<InputLabelProps>
{
}

