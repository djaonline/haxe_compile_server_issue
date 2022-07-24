package helppy.web.mui.autocomplete;

import helppy.core.data.ui.ItemData;
import helppy.core.lang.data.LocaleItemData;
import helppy.web.lang.view.LangLabel;
import js.html.SelectElement;
import mui.core.TextField;
import mui.lab.Autocomplete as MUIAutocomplete;
import react.ReactEvent;
import react.ReactMacro.jsx;
import react.types.SyntheticEvent.ChangeEvent;

using helppy.web.util.CssUtil;

typedef AutocompleteProps =
{
	options: Array<ItemData>,
	?value: String,
	?inputValue: String,
	?defaultValue: String,
	?loading: Bool,
	?required: Bool,
	?disabled: Bool,
	?labelLocalItemData: LocaleItemData,
	?labelTextId: String,
	?labelText: String,
	?name: String,
	?getOptionLabel: ItemData -> String,
	?getOptionSelected: ItemData -> Bool,
	?getOptionDisabled: ItemData -> Bool,
	?loadMoreResults: Void -> Void,
	?onChange: (e: ReactEvent, value: ItemData, reason: String, ?details: String) -> Void,
	?onInputChange: (e: ReactEvent, value: String, reason: String) -> Void
}

@:jsxStatic('render')
class Autocomplete
{
	public static function render(props: AutocompleteProps)
	{
		final onScroll = (event: ChangeEvent<SelectElement>) -> 
		{
			final listboxNode = event.currentTarget;
			if ((listboxNode.scrollTop + listboxNode.clientHeight) == listboxNode.scrollHeight) 
			{
				if (props.loadMoreResults != null)
				{
					props.loadMoreResults();
				}
			}
		};
		return jsx('
			<$MUIAutocomplete className=${"".addStyle(props)}
				options=${props.options}
				value=${props.value}
				inputValue=${props.inputValue}
				defaultValue=${props.defaultValue}
				fullWidth=${true}
				handleHomeEndKeys=${true}
				loading=${props.loading}
				disabled=${props.disabled}
				loadingText=${jsx('<$LangLabel textId="loading" />')}
				noOptionsText=${jsx('<$LangLabel textId="noOptions" />')}
				ListboxProps=${{ onScroll: onScroll }}
				getOptionLabel=${props.getOptionLabel}
				getOptionSelected=${props.getOptionSelected}
				getOptionDisabled=${props.getOptionDisabled}
				renderInput=${
					(params) -> 
						jsx('
							<$TextField {...params}
								name=${props.name}
								required=${props.required}
								label=${
									jsx('
										<$LangLabel localItemData=${props.labelLocalItemData}
											textId=${props.labelTextId}
											text=${props.labelText} />
								')} />
						')
				}
				onChange=${props.onChange}
				onInputChange=${props.onInputChange} />
		');
	}
}
