package mui.pickers;

typedef ColorData =
{
	hex: String
} 

typedef SketchPickerProps =
{
	color: Any,
	?onChange: ColorData -> Void,
	?onChangeComplete: ColorData -> Void
}

@:jsRequire('react-color', 'SketchPicker')
extern class SketchPicker extends ReactComponentOfProps<SketchPickerProps>
{
}