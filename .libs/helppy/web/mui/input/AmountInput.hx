package helppy.web.mui.input;

import helppy.core.lang.data.LocaleItemData;
import helppy.web.lang.view.LangLabel;
import helppy.web.mui.adornment.BaseAdornmentProps;
import helppy.web.ui.input.MUIAmountInput;
import mui.core.FormControl.FormControlSize;
import mui.core.FormControl.FormControlVariant;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

private typedef AmountInputProps = 
{
	>BaseAdornmentProps,
	amount: Float,
	?labelTextId: String,
	?labelLocaleItem: LocaleItemData,
	?name: String,
	?helperTextId: String,
	?helperValue: Float,
	?disabled: Bool,
	?scale: Int,
	?size: FormControlSize,
	?variant: FormControlVariant,
	?allowNegative: Bool,
	?onlyInt: Bool,
	?minAmount: Int,
	?maxAmount: Int,
	?maxLength: Int,
	?required: Bool,
	?error: Bool,
	?onAmountChange: Float -> Void,
	?onFocus: Void -> Void,
	?onBlur: Void -> Void,
}

@:jsxStatic('render')
class AmountInput 
{
	public static function render(props: AmountInputProps)
	{
		final helperText = props.helperTextId != null ?
			jsx('
				<$LangLabel textId=${props.helperTextId}>: ${props.helperValue}</$LangLabel>
			')
			: null;
		final scale = props.scale != null ? props.scale : 7;
		return jsx('
			<$MUIAmountInput className=${"".addStyle(props)}
				amount=${props.amount}
				name=${props.name}
				scale=${scale}
				size=${props.size}
				InputProps=${{
					startAdornment: (props: ExtBaseAdornmentProps).getComp(true, true),
					endAdornment: (props: ExtBaseAdornmentProps).getComp(false, true),
				}}
				allowNegative=${props.allowNegative}
				onlyInt=${props.onlyInt}
				minAmount=${props.minAmount}
				maxAmount=${props.maxAmount}
				maxLength=${props.maxLength}
				required=${props.required}
				error=${props.error}
				disabled=${props.disabled}
				variant=${props.variant}
				label=${jsx('
					<$LangLabel textId=${props.labelTextId} 
						localItemData=${props.labelLocaleItem} />
				')}
				helperText=${helperText}
				fullWidth=${true}
				onAmountChange=${props.onAmountChange}
				onFocus=${props.onFocus}
				onBlur=${props.onBlur} />
		');
	}
}