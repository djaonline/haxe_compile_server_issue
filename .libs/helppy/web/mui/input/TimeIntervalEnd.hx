package helppy.web.mui.input;

import app.main.theme.ColorPallete;
import helppy.core.data.TimeIntervalUnit as TimeUnit;
import helppy.core.lang.data.LocaleItemData;
import helppy.web.mui.input.AmountInput;
import helppy.web.mui.select.TimeUnitSelect;
import mui.core.FormControl.FormControlSize;
import mui.core.Grid;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent;
import react.ReactMacro.jsx;
import util.time.TimeIntervalUtil;

typedef TimeIntervalEndProps =
{
	value: Int,
	?defaultUnit: TimeUnit,
	?size: FormControlSize,
	?startAdornmentTextId: String,
	?disabled: Bool,
	?name: String,
	?required: Bool,
	?hideUnits: Array<TimeUnit>,
	?labelLocaleItem: LocaleItemData,
	?onValueChange: Int -> Void,
	?onValueInit: Int -> Void
}

typedef TimeIntervalEndState =
{
	timeUnit: TimeUnit
}

class TimeIntervalEnd extends ReactComponentOfPropsAndState<TimeIntervalEndProps, TimeIntervalEndState>
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

	private var _initiated: Bool = false;
	private var _value: Dynamic;

	var _defaultUnit = TimeUnit.SEC;

	public function new(props: TimeIntervalEndProps) 
	{
		super();
		if (props.defaultUnit != null)
		{
			_defaultUnit = props.defaultUnit;
		}
		state = { timeUnit: _defaultUnit };	
	}

	override function render()
	{
		return jsx('<$TimeIntervalEndImpl />');
	}

	function TimeIntervalEndImpl()
	{
		final classes = useStyle();
		var unit = getTimeUnit();
		final valueInSec = props.value;
		_value = valueInSec;
		if (valueInSec != null)
		{
			if (_initiated) 
			{
				_value = TimeIntervalUtil.getValue(valueInSec, unit);
			}
			else
			{
				_value = TimeIntervalUtil.secToTimeUnit(valueInSec).getValue();
			}
		}
		return jsx('
			<$Grid item=${true} xs=${GridsNumber.Grids_12}>
				<$AmountInput amount=${_value != null ? _value : ""}
					size=${props.size}
					startAdornmentTextId=${props.startAdornmentTextId}
					endAdornment=${jsx('
						<$TimeUnitSelect value=${unit}
							name=${props.name + " - Ед. изм."}
							hideUnits=${props.hideUnits}
							size=${FormControlSize.Small}
							disabled=${props.disabled}
							disableUnderline=${true}
							selectClasses=${{ icon: classes.selectIcon, selectMenu: classes.select }}
							onChange=${onChangeTimeUnit} />
					')}
					onlyInt=${true}
					disabled=${props.disabled}
					name=${props.name}
					required=${props.required}
					labelLocaleItem=${props.labelLocaleItem}
					onAmountChange=${onValueChange} />
			</$Grid>
		');
	}

	function getTimeUnit(): TimeUnit
	{
		return if (_initiated)
			state.timeUnit;
		else if (props.value == null)
			_defaultUnit;
		else
			TimeIntervalUtil.secToTimeUnit(props.value).getUnit();
	}

	function dispatchValue(value: Int, unit: TimeUnit)
	{
		final valueInSec = if (value != null)
		{
			TimeIntervalUtil.getValueInSec(value, unit);
		}
		else
		{
			value;
		}
		if (!_initiated)
			props.onValueInit(valueInSec);
		else
			props.onValueChange(valueInSec);
	}

	function onValueChange(value: Int) 
	{
		dispatchValue(value, getTimeUnit());
	}

	override function componentDidMount() 
	{
		onChangeTimeUnit(getTimeUnit());
		_initiated = true;
	}

	function onChangeTimeUnit(timeUnit: TimeUnit)
	{
		setState({ timeUnit: timeUnit });
		dispatchValue(_value, timeUnit);
	}
}