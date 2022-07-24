package helppy.web.mui.select;

import helppy.web.lang.view.LangLabel;
import helppy.web.mui.select.SelectInput.SelectItems;
import mui.core.Button;
import react.ReactComponent;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef SelectBtnProps = 
{
	?value: String,
	items: SelectItems,
	?onChange: String -> Void
}

typedef SelectBtnState = 
{
	index: Int 
}

class SelectBtn extends ReactComponentOfPropsAndState<SelectBtnProps, SelectBtnState>
{
	public function new(props) 
	{
		super(props);
		var currentIndex = 0;
		if (props.value != null)
		{
			for(i in 0 ... props.items.length)
			{
				final item = props.items[i];
				if (item.value == props.value)
				{
					currentIndex = i;
					break;
				}
			}
		}
		state = { index: currentIndex };
	}

	override function render() 
	{
		final item = props.items[state.index];
		return jsx('
			<$Button className=${"".addStyle(props)}
				onClick=${onClick}
				size=${ButtonSize.Small}>
				<$LangLabel textId=${item.textId}
					text=${item.text}
					localItemData=${item.localItemData} />
			</$Button>
		');
	}

	function onClick() 
	{
		var newIndex = 0;
		if (state.index < props.items.length - 1)
		{
			newIndex = state.index + 1;
		}
		setState({ index: newIndex });
		if (props.onChange != null)
			props.onChange(props.items[newIndex].value);
	}
}