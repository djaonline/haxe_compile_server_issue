package helppy.web.mui.input;

import helppy.core.lang.Language;
import helppy.web.lang.view.LangLabel;
import js.Browser;
import js.html.InputElement;
import js.html.KeyboardEvent;
import mui.core.FormControl;
import mui.core.IconButton;
import mui.core.InputAdornment;
import mui.core.TextField;
import mui.icons.Search as MUISearch;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.types.event.SyntheticEvent.ChangeEvent;

using helppy.core.lang.LangManager;
using helppy.web.util.CssUtil;

typedef SearchInputProps =
{
	value: String,
	?disabled: Bool,
	?onSearchChange: String -> Void,
	?onSearchClick: String -> Void
}

class SearchInput extends ReactComponentOfProps<SearchInputProps>
{
	override function render() 
	{
		final value = props.value == null ? "" : props.value;
		return jsx('
			<$TextField className=${"".addStyle(props)}
				value=${value}
				disabled=${props.disabled}
				variant=${FormControlVariant.Outlined}
				label=${jsx('<$LangLabel textId="search" />')}
				name=${"search".getTextByLanguage(Language.RU)}
				onChange=${onSearchChange}
				fullWidth=${true}
				InputProps=${{
					endAdornment: getEndAdornment()
				}} />
		');
	}

	function getEndAdornment()
	{
		return if (props.onSearchClick != null)
			jsx('
				<$InputAdornment position=${InputAdornmentPosition.End}
					name="Выполнить поиск">
					<$IconButton edge=${InputAdornmentPosition.End}
						disabled=${props.disabled}
						onClick=${props.onSearchClick.bind(props.value)}>
						<$MUISearch />
					</$IconButton>
				</$InputAdornment>
			')
		else
			null;
	}

	function onSearchChange(e: ChangeEvent<InputElement>)
	{
		if (props.onSearchChange != null)
			props.onSearchChange(e.target.value);
	}

	override public function componentDidMount(): Void 
	{
		Browser.window.addEventListener('keypress', onKeyPress);
	}
	
	override public function componentWillUnmount(): Void 
	{
		Browser.window.removeEventListener('keypress', onKeyPress);
	}

	function onKeyPress(e: KeyboardEvent)
	{
		if (e.keyCode == KeyboardEvent.DOM_VK_RETURN && !props.disabled)
		{
			if (props.onSearchClick != null)
				props.onSearchClick(props.value);
		}
	}
}