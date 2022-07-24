package mui.core;

import mui.core.input.InputValue;
import mui.core.input.InputType;
import mui.core.FormControl.FormControlMarginNoneDense;
import js.html.InputElement;
import react.types.or.StringOrInt;

typedef InputBaseCommonProps = 
{
	?autoComplete: String,
	?autoFocus: Bool,
	?children: Noise,
	?className: String,
	?defaultValue: InputValue,
	?disabled: Bool,
	?error: Bool,
	?fullWidth: Bool,
	?id: String,
	?inputProps: Dynamic,
	?inputRef: ReactRef<InputElement>,
	?margin: FormControlMarginNoneDense,
	?multiline: Bool,
	?onChange: HandlerOrVoid<ClassicHandler>,
	?placeholder: String,
	?rows: StringOrInt,
	?rowsMax: StringOrInt,
	?select: Bool,
	?type: InputType,
	?value: InputValue,
}

typedef InputBaseClassProps<T> =
{
	?root: T,
	?formControl: T,
	?focused: T,
	?disabled: T,
	?adornedStart: T,
	?adornedEnd: T,
	?error: T,
	?marginDense: T,
	?multiline: T,
	?colorSecondary: T,
	?fullWidth: T,
	?input: T,
	?inputMarginDense: T,
	?inputMultiline: T,
	?inputTypeSearch: T,
	?inputAdornedStart: T,
	?inputAdornedEnd: T,
	?inputHiddenLabel: T
}

typedef InputBaseProps = ForcedOverride<StandardDOMAttributes, 
{
	>InputBaseCommonProps,
	?classes: InputBaseClassProps<String>,
	?endAdornment: ReactFragment,
	?inputComponent: ReactType,
	?name: String,
	?readOnly: Bool,
	?required: Bool,
	?startAdornment: ReactFragment,
}>;

@:jsRequire('@material-ui/core', 'InputBase')
extern class InputBase extends ReactComponentOfProps<InputBaseProps>
{
}

