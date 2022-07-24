package helppy.web.mui.input;

import app.main.theme.ColorPallete;
import helppy.core.data.ui.ItemData;
import helppy.web.mui.input.AmountInput;
import helppy.web.mui.select.SelectInput;
import mui.core.FormControl.FormControlSize;
import mui.core.styles.MuiTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent;
import react.ReactMacro.jsx;

typedef CombinedAmountInputProps =
{
	inputAmount: Float,
	inputOnlyInt: Bool,
	inputRequired: Bool,
	inputMaxAmount: Int,
	inputName: String,
	selectValue: String,
	selectItems: Array<ItemData>,
	selectRequired: Bool,
	selectName: String,
	labelTextId: String,
	onAmountChange: Float -> Void,
	onSelectChange: String -> Void
}

class CombinedAmountInput extends ReactComponentOfProps<CombinedAmountInputProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) -> 
	{
		selectIcon: 
		{
			fontSize: '1.2rem',
			right: '3px',
			top: 'calc(50% - 9px)'
		},
		select: 
		{
			color: ColorPallete.PRIMARY,
			height: '9px',
			paddingTop: '4px'
		}
	});

	override function render()
	{
		return jsx('<$InputImpl />');
	}

	function InputImpl() 
	{
		final classes = useStyle();
		return jsx('
			<$AmountInput amount=${props.inputAmount}
				endAdornment=${jsx('
					<$SelectInput value=${props.selectValue}
						name=${props.selectName}
						items=${props.selectItems}
						size=${FormControlSize.Small}
						disableUnderline=${true}
						required=${props.selectRequired}
						selectClasses=${{ icon: classes.selectIcon, selectMenu: classes.select }}
						onChange=${props.onSelectChange} />
				')}
				labelTextId=${props.labelTextId}
				name=${props.inputName}
				onlyInt=${props.inputOnlyInt}
				maxAmount=${props.inputMaxAmount}
				required=${props.inputRequired}
				onAmountChange=${props.onAmountChange} />
		');
	}
}