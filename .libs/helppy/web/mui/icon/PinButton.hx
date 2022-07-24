package helppy.web.mui.icon;

import helppy.web.mui.hint.HintIcon;
import helppy.web.ui.common.Selectable;
import js.npm.iconify.Icon;
import js.npm.iconify.icons_ic.RoundPin;
import js.npm.iconify.icons_ic.RoundPinOff;
import mui.core.IconButton;
import react.ReactMacro.jsx;

typedef PinButtonProps = 
{
	pinned: Bool,
	?onToggle: (value: Bool) -> Void
}

@:jsxStatic('render')
class PinButton 
{
	public static function render(props: PinButtonProps)
	{
		return jsx('
			<$Selectable selected=${props.pinned}
				onSelected=${props.onToggle}>
				<$Btn />
			</$Selectable>
		');
	}

	static function Btn(props: {selected: Bool, onClick: Dynamic -> Void}) 
	{
		final iconClass: Class<Dynamic> = props.selected ? RoundPinOff : RoundPin;
		return jsx('
			<$HintIcon textId=${props.selected ? "unpinned" : "pinned"}>
				<$IconButton size=${IconButtonSize.Small}
					onClick=${props.onClick}>
					<$Icon icon=${iconClass}
						width=${20}
						height=${20} />
				</$IconButton>
			</$HintIcon>
		');
	}
}