package mui.core;

import js.html.InputElement;
import mui.common.Color.ColorDPS;
import mui.core.IconButton.IconButtonProps;
import mui.core.input.InputType;

enum abstract CheckedStatus(Bool) from Bool 
{
	var Checked = true;
	var Unchecked = false;
}

typedef CheckboxClassProps<T> = 
{
	?root: T,
	?checked: T,
	?disabled: T,
	?indeterminate: T,
	?colorPrimary: T,
	?colorSecondary: T
}

typedef CheckboxProps = ForcedOverride<IconButtonProps, {
	?children: Noise,
	?checked: CheckedStatus,
	?checkedIcon: ReactFragment,
	?classes: CheckboxClassProps<String>,
	?color: ColorDPS,
	?disabled: Bool,
	?disableRipple: Bool,
	?icon: ReactFragment,
	?id: String,
	?indeterminate: Bool,
	?indeterminateIcon: ReactFragment,
	?inputProps: {},
	?inputRef: ReactRef<InputElement>,
	?onChange: HandlerOrVoid<Event->Bool->Void>,
	?required: Bool,
	?type: InputType,
	?value: String,
}>;

@:jsRequire('@material-ui/core', 'Checkbox')
extern class Checkbox extends ReactComponentOfProps<CheckboxProps>
{
}

