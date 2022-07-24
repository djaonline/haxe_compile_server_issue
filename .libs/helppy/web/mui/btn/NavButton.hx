package helppy.web.mui.btn;

import helppy.core.lang.LangManager;
import helppy.core.lang.Language;
import helppy.web.mui.hint.HintIcon;
import mui.core.IconButton;
import mui.icons.FirstPage as FirstPageIcon;
import mui.icons.KeyboardArrowLeft as KeyboardArrowLeftIcon;
import mui.icons.KeyboardArrowRight as KeyboardArrowRightIcon;
import mui.icons.LastPage as LastPageIcon;
import react.ReactMacro.jsx;

enum abstract NavDirection(String) to String
{
	var First = "first";
	var Prev = "prev";
	var Next = "next";
	var Last = "last";
}

typedef NavButtonProps = 
{
	direction: NavDirection,
	disabled: Bool,
	?onClick: (direction: NavDirection) -> Void
}

@:jsxStatic('render')
class NavButton 
{
	public static function render(props: NavButtonProps)
	{
		final direction = props.direction;
		final name = LangManager.getTextByLanguage(direction, Language.RU);
		return jsx('
			<$HintIcon textId=${direction}>
				<$IconButton name=${name}
					disabled=${props.disabled}
					size=${IconButtonSize.Small}
					onClick=${props.onClick.bind(props.direction)}>
					${renderIcon(direction)}
				</$IconButton>
			</$HintIcon>
		');
	}

	static function renderIcon(direction: NavDirection) 
	{
		return switch direction
		{
			case First: jsx('<$FirstPageIcon />');
			case Prev: jsx('<$KeyboardArrowLeftIcon />');
			case Next: jsx('<$KeyboardArrowRightIcon />');
			case Last: jsx('<$LastPageIcon />');
		} 	
	}
}
