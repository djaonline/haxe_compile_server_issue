package helppy.web.mui.picker;

import js.lib.Date;
import mui.core.FormControl;
import react.ReactComponent.ReactElement;

typedef PickerProps =
{
	value: Any,
	?inputVariant: FormControlVariant,
	?size: FormControlSize,
	?views: Array<String>,
	?format: String,
	?style: Any,
	?onChange: (date: Date) -> Void,
	?onAccept: (date: Date) -> Void,
	?onClose: () -> Void,
	?onError: (error: Dynamic, date: Date) -> Void,
	?onOpen: () -> Void,
	?open: Bool,
	?readOnly: Bool,
	?ampm: Bool,
	?keyboardIcon: ReactElement,
	?helperText: String,
	?InputProps: {
		?endAdornment: ReactElement,
		?startAdornment: ReactElement
	}
} 