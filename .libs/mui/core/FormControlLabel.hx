package mui.core;

import js.html.InputElement;
import mui.core.Checkbox.CheckedStatus;

enum abstract FormLabelPlacement(String) to String 
{
	var Start = "start";
	var End = "end";
	var Top = "top";
	var Bottom = "bottom";
}

typedef FormControlLabelClassProps<T> =
{
	?root: T,
	?marginNormal: T,
	?marginDense: T,
	?fullWidth: T
}

typedef FormControlLabelProps = ForcedOverride<StandardDOMAttributes, {
	?children: Noise,
	?classes: FormControlLabelClassProps<String>,
	?checked: CheckedStatus,
	?control: ReactFragment,
	?disabled: Bool,
	?inputRef: ReactRef<InputElement>,
	?label: ReactFragment,
	?labelPlacement: FormLabelPlacement,
	?name: String,
	?onChange: HandlerOrVoid<Event->Bool->Void>,
	?value: String,
}>;

@:jsRequire('@material-ui/core', 'FormControlLabel')
extern class FormControlLabel extends ReactComponentOfProps<FormControlLabelProps>
{
}

