package helppy.web.mui.hint;

import helppy.web.lang.view.LangLabel;
import js.html.Element;
import mui.core.Tooltip;
import react.PureComponent;
import react.ReactComponent.ReactElement;
import react.types.SyntheticEvent.MouseEvent;
import react.ReactMacro.jsx;

typedef HintIconProps = 
{
	>LangLabelProps,
	?children: Any,
	?className: String,
	?atCursor: Bool,
	?followCursor: Bool
}

typedef HintIconState = 
{
	?x: Float,
	?y: Float
}

class HintIcon extends PureComponentOfPropsAndState<HintIconProps, HintIconState>
{
	override function render() 
	{
		return jsx('
			<$Tooltip title=${getText()}
				disableHoverListener=${isDisabled()}
				PopperProps=${getPopperProps()}>
				<span>
					${props.children}
				</span>
			</$Tooltip>
		');
	}

	inline function isDisabled() return props.text == null && props.textId == null && props.localItemData == null;

	inline function getText(): ReactElement 
	{
		return jsx('
			<$LangLabel text=${props.text}
				textId=${props.textId}
				localItemData=${props.localItemData} />
		');
	}

	function getPopperProps()
	{
		return if (props.followCursor || props.atCursor)
			{
				anchorEl: 
				{
					clientHeight: 0,
					clientWidth: 0,
					getBoundingClientRect: () -> ({
						top: state.y,
						left: state.x,
						right: state.x,
						bottom: state.y,
						width: 0,
						height: 0,
					})
				}
			}
		else
			null;
	}

	function onMouseEnter(e: MouseEvent<Element>)
	{
		if (props.atCursor)
			setState({ x: e.clientX, y: e.clientY });
	}

	function onMouseMove(e: MouseEvent<Element>)
	{
		if (props.followCursor)
			setState({ x: e.clientX, y: e.clientY });
	}
}