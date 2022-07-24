package mui.core;

import mui.core.Input.InputProps;
import mui.core.InputBase.InputBaseCommonProps;
import mui.core.InputLabel.InputLabelProps;
import mui.core.FormControl.FormControlSize;
import mui.core.FormControl.FormControlProps;
import mui.core.FormHelperText.FormHelperTextProps;

typedef TextFieldProps = ForcedOverride<FormControlProps, 
{
	>InputBaseCommonProps,
	?children: Noise,
	?FormHelperTextProps: Partial<FormHelperTextProps>,
	?helperText: ReactFragment,
	?InputLabelProps: Partial<InputLabelProps>,
	?InputProps: Partial<InputProps>,
	?label: ReactFragment,
	?select: Bool,
	?SelectProps: Dynamic, //Partial<SelectProps<TData>>
	?size: FormControlSize,
}>;

@:jsRequire('@material-ui/core', 'TextField')
extern class TextField extends ReactComponentOfProps<TextFieldProps>
{
}

