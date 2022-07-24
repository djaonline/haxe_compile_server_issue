package helppy.web.mui.picker;

import helppy.web.mui.hint.HintIcon;
import mui.icons.Event;
import mui.icons.IconProps.SvgIconFontSize;
import mui.pickers.KeyboardDatePicker as MuiKeyboardDatePicker;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class KeyboardDatePicker
{
	public static function render(props: PickerProps)
	{
		final format = props.format == null ? "DD.MM.YYYY" : props.format;
		return jsx('
			<$PickersUtilsProvider>
				<$MuiKeyboardDatePicker {...props} 
					format=${format}
					keyboardIcon=${jsx('
						<$HintIcon textId="selectDate">
							<$Event fontSize=${SvgIconFontSize.Small} />
						</$HintIcon>
					')} />
			</$PickersUtilsProvider>
		');
	}
}