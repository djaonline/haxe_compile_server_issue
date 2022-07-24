package mui.core;

import mui.common.Color;

typedef FormLabelClassProps<T> =
{
	?root: T,
	?colorSecondary: T,
	?focused: T,
	?disabled: T,
	?error: T,
	?filled: T,
	?required: T,
	?asterisk: T
}

typedef FormLabelProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: FormLabelClassProps<String>,
	?color: ColorPSI,
	?component: ReactType,
	?disabled: Bool,
	?error: Bool,
	?filled: Bool,
	?focused: Bool,
	?required: Bool,
	?htmlFor: String,
};

@:jsRequire('@material-ui/core', 'FormLabel')
extern class FormLabel extends ReactComponentOfProps<FormLabelProps>
{
}

