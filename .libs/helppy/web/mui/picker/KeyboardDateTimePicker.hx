package helppy.web.mui.picker;

import component.hint.mui.HintIcon;
import mui.icons.Event;
import mui.icons.IconProps.SvgIconFontSize;
import mui.pickers.KeyboardDateTimePicker as MuiKeyboardDateTimePicker;
import react.ReactMacro.jsx;

@:jsxStatic('render')
class KeyboardDateTimePicker
{
	public static function render(props: PickerProps)
	{
		final format = props.format == null ? "DD.MM.YYYY HH:mm" : props.format;
		return jsx('
			<$PickersUtilsProvider>
				<$MuiKeyboardDateTimePicker {...props} 
					format=${format}
					keyboardIcon=${jsx('
						<$HintIcon textId="selectDateTime">
							<$Event fontSize=${SvgIconFontSize.Small} />
						</$HintIcon>
					')} />
			</$PickersUtilsProvider>
		');
	}
}