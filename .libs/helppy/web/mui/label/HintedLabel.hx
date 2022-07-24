package helppy.web.mui.label;

import helppy.web.lang.view.LangLabel;
import js.html.Element;
import js.html.HtmlElement;
import js.npm.clsx.Clsx;
import js.npm.glamor.Css;
import mui.core.Tooltip;
import mui.core.Typography;
import react.PureComponent;
import react.ReactComponent.ReactElement;
import react.types.SyntheticEvent.MouseEvent;
import react.ReactMacro.jsx;

typedef HintedLabelProps = 
{
	>LangLabelProps,
	?className: String,
	?typographyVariant: TypographyVariant,
	?gutterBottom: Bool,
	?tooltipTitle: ReactElement,
	?atCursor: Bool,
	?followCursor: Bool,
	?maxCharCount: Int,
	?alwaysShowHint: Bool
}

typedef HintedLabelState = 
{
	textOverflowed: Bool,
	?x: Float,
	?y: Float
}

class HintedLabel extends PureComponentOfPropsAndState<HintedLabelProps, HintedLabelState>
{
	var _textContainer: HtmlElement;
	
	public function new()
	{
		super();
		state = { textOverflowed: false };
	}

	override function render() 
	{
		return jsx('<$HintedLabelImpl />');
	}

	function HintedLabelImpl() 
	{
		final text = getText();
		final tooltipTitle = props.tooltipTitle != null ? props.tooltipTitle : text;
		final typographyStyle = 
		if (props.maxCharCount != null)
		{
			final maxCharStyle = Css.style({
				maxWidth: props.maxCharCount + 'ch'
			});
			Clsx.combine(props.className, '${maxCharStyle}');
		}
		else
			props.className;
		final showHint = props.alwaysShowHint || state.textOverflowed;
		return jsx('
			<$Tooltip title=${tooltipTitle}
				disableHoverListener=${!showHint}
				PopperProps=${getPopperProps()}>
				<$Typography className=${typographyStyle}
					noWrap=${true}
					variant=${props.typographyVariant}
					gutterBottom=${props.gutterBottom}
					onMouseEnter=${onMouseEnter}
					onMouseMove=${onMouseMove}
					ref=${onTypographyGetRef}>
					${text}
				</$Typography>
			</$Tooltip>
		');
	}
	
	function onTypographyGetRef(elem: HtmlElement) 
	{
		_textContainer = elem;
	}

	inline function getText(): ReactElement 
	{
		return jsx('
			<$LangLabel name=${props.name}
				text=${props.text}
				textId=${props.textId}
				localItemData=${props.localItemData}>
				${props.children}
			</$LangLabel>
		');
	}

	override function componentDidMount() 
	{
		update();
	}

	override function componentDidUpdate(_, _) 
	{
		update();
	}

	public function update() 
	{
		if (_textContainer != null) 
		{
			final boundingClientRectWidth = Math.round(_textContainer.getBoundingClientRect().width);
			final offsetWidth = _textContainer.offsetWidth;
			final scrollWidth = _textContainer.scrollWidth;
			final overflowed = (scrollWidth > offsetWidth) && (boundingClientRectWidth == offsetWidth);
			setState({ textOverflowed: overflowed });	
		}
	}

	function getPopperProps()
	{
		return if (props.followCursor || props.atCursor)
			{
				anchorEl: 
				{
					clientHeight: 0,
					clientWidth: 0,
					getBoundingClientRect: () -> {
						top: state.y,
						left: state.x,
						right: state.x,
						bottom: state.y,
						width: 0,
						height: 0,
					}
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