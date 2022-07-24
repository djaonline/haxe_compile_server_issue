package helppy.web.mui.input;

import helppy.core.util.StringUtil;
import helppy.web.ui.input.MaskedInput as HelppyMaskedInput;
import mui.core.FormControl;
import mui.core.Input;
import mui.core.InputLabel;
import mui.core.TextField;
import mui.core.input.InputType;
import react.ReactComponent;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef MaskedInputProps =
{
	>TextFieldProps,
	mask: String,
	?maskSymb: String,
	?name: String,
	?isAmount: Bool,
	?maxLength: String,
	?onValueChange: String -> Void
}

class MaskedInput extends ReactComponentOfProps<MaskedInputProps>
{
	override function render() 
	{
		return jsx('
			<FormControl variant=${props.variant}
				fullWidth=${props.fullWidth}
				required=${props.required}
				disabled=${props.disabled}
				size=${props.size}>
				<InputLabel shrink=${true}>${props.label}</InputLabel>
				<$Input className=${"".addStyle(props)}
					type=${InputType.Text}
					multiline=${props.multiline}
					rows=${props.rows}
					inputProps=${{ maxLength: props.maxLength }}
					inputComponent=${getMaskedInput} />
			</FormControl>
		');
	}

	function getMaskedInput()
	{
		final value = props.value == null || props.value == "" ? props.mask : props.value;
		final className = "MuiInputBase-input MuiInput-input" + (props.disabled ? " Mui-disabled" : "");
		final validate = (char: String, newValue: String, selectionStart: Int) ->
		{
			final regExp = new EReg("\\" + props.maskSymb, "g");
			return props.isAmount ? StringUtil.isAmount(regExp.replace(newValue, ""), 2) : true;
		};
		final maskSymb = props.maskSymb != null ? props.maskSymb : HelppyMaskedInput.defaultProps.maskSymb;
		return jsx('
			<$HelppyMaskedInput className=${className}
				value=${value}
				name=${props.name}
				mask=${props.mask}
				maskSymb=${maskSymb}
				disabled=${props.disabled}
				validate=${validate}
				onValueChange=${props.onValueChange} />
		');
	}
}