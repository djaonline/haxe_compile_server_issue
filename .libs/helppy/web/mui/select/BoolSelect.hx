package helppy.web.mui.select;

import helppy.core.data.ui.ItemData;
import helppy.web.mui.select.SelectInput;
import mui.core.FormControl.FormControlSize;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef BoolSelectProps = 
{
	value: Bool,
	?name: String,
	?size: FormControlSize,
	?onChange: (checked: Bool) -> Void
}

@:jsxStatic("render")
class BoolSelect
{
	public static function render(props: BoolSelectProps)
	{
		function onChange(checked: Bool) 
		{
			if (props.onChange != null)
				props.onChange(checked);
		};
		final items: Array<ItemData> =
		[
			{
				id: true,
				textId: "yes"
			},
			{
				id: false,
				textId: "no"
			}
		];
		return jsx('
			<$SelectInput className=${"".addStyle(props)}
				value=${props.value}
				items=${items}
				name=${props.name}
				size=${props.size}
				required=${true}
				onChange=${onChange} />
		');
	}
}