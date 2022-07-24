package mui.core;

import mui.common.Color;

enum abstract FormControlVariant(String) 
{
	var Standard = "standard";
	var Outlined = "outlined";
	var Filled = "filled";
}

enum abstract FormControlMargin(String) 
{
	var None = "none";
	var Dense = "dense";
	var Normal = "normal";
}

enum abstract FormControlMarginNoneDense(String) 
{
	var None = "none";
	var Dense = "dense";
}

enum abstract FormControlMarginDense(String) 
{
	var Dense = "dense";
}

enum abstract FormControlSize(String) 
{
	var Small = "small";
	var Medium = "medium";
}

typedef FormControlClassProps<T> =
{
	?root: T,
	?marginNormal: T,
	?marginDense: T,
	?fullWidth: T
}

typedef FormControlProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: FormControlClassProps<String>,
	?color: ColorPSI,
	?component: ReactType,
	?disabled: Bool,
	?error: Bool,
	?fullWidth: Bool,
	?hiddenLabel: Bool,
	?margin: FormControlMargin,
	?required: Bool,
	?size: FormControlSize,
	?variant: FormControlVariant
}

@:jsRequire('@material-ui/core', 'FormControl')
extern class FormControl extends ReactComponentOfProps<FormControlProps>
{
}

