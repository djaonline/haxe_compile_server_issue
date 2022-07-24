package helppy.web.mui.radio;

import helppy.core.data.ui.ItemData;
import helppy.web.lang.view.LangLabel;
import js.html.InputElement;
import mui.common.Color;
import mui.core.FormControlLabel;
import mui.core.Radio;
import mui.core.RadioGroup as MUIRadioGroup;
import mui.core.Typography;
import react.ReactFragment;
import react.ReactMacro.jsx;
import react.types.event.SyntheticEvent;

using helppy.web.util.CssUtil;

enum abstract RadioDirection(Int) 
{
	var Horizontal = 0;
	var Vertical = 1;
}

typedef RadioGroupProps = 
{
	selectedId: String,
	items: Array<ItemData>,
	?direction: RadioDirection,
	onChange: (id: String) -> Void
}

@:jsxStatic('render')
class RadioGroup
{
	public static function render(props: RadioGroupProps) 
	{
		final onChange = (e: ChangeEvent<InputElement>) ->
		{
			props.onChange(e.target.value);
		};
		final row = switch props.direction
		{
			case RadioDirection.Horizontal: true;
			case RadioDirection.Vertical: false;
			case _: false;
		};
		return jsx('
			<$MUIRadioGroup className=${"".addStyle(props)}
				value=${props.selectedId}
				row=${row}
				onChange=${onChange}>
				<$Buttons {...props} />
			</$MUIRadioGroup>
		');
	}

	static function Buttons(props: RadioGroupProps): Array<ReactFragment>
	{
		return
		[
			for (item in props.items) 
			{
				jsx('
					<div name=${item.name}
						key=${item.id}>
						<$FormControlLabel value=${item.id}
							control=${jsx('<$Radio color=${Color.Primary} />')}
							label=${jsx('
								<$Typography variant=${TypographyVariant.Body1}>
									<$LangLabel textId=${item.textId}
										text=${item.text}
										localItemData=${item.localeItemData} />
								</$Typography>
							')} />
					</div>
				');	
			}
		];
	}
}