package helppy.web.mui.select;

import helppy.core.data.TimeIntervalUnit as TimeUnit;
import helppy.core.data.ui.ItemData;
import mui.core.FormControl.FormControlSize;
import mui.core.Select.SelectClassProps;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef TimeUnitSelectProps =
{
	value: TimeUnit,
	?name: String,
	?size: FormControlSize,
	?disabled: Bool,
	?hideUnits: Array<TimeUnit>,
	?disableUnderline: Bool,
	?selectClasses: SelectClassProps<String>,
	?onChange: (type: TimeUnit) -> Void
}

@:jsxStatic('render')
class TimeUnitSelect
{
	public static function render(props: TimeUnitSelectProps)
	{
		final units: Array<ItemData> =
		[
			{ id: TimeUnit.SEC, textId: "shortNameSeconds" },
			{ id: TimeUnit.MIN, textId: "shortNameMinutes" },
			{ id: TimeUnit.HOUR, textId: "shortNameHours" },
			{ id: TimeUnit.DAY, textId: "shortNameDays" }
		];
		final items =
		[
			for (i in 0...units.length) 
			{
				final unit = units[i];
				if (props.hideUnits == null || props.hideUnits.indexOf(unit.id) == -1)
				{
					unit;
				}
			}
		];
		final onChange = (value: TimeUnit) ->
		{
			if (props.onChange != null)
				props.onChange(value);
		};
		return jsx('
			<$SelectInput className=${"".addStyle(props)}
				value=${props.value}
				name=${props.name}
				items=${items}
				size=${props.size}
				labelId="unitMeasurement"
				required=${true}
				disabled=${props.disabled}
				disableUnderline=${props.disableUnderline}
				selectClasses=${props.selectClasses}
				onChange=${onChange} />
		');
	}
}