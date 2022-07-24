package helppy.web.mui.picker;

import mui.icons.AccessTime;
import mui.icons.IconProps.SvgIconFontSize;
import mui.pickers.KeyboardTimePicker as MuiKeyboardTimePicker;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class KeyboardTimePicker
{
	public static function render(props: PickerProps)
	{
		return jsx('
			<$PickersUtilsProvider>
				<$MuiKeyboardTimePicker {...props}
					keyboardIcon=${jsx('
						<></>
					')} />
			</$PickersUtilsProvider>
		');
	}
}