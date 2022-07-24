package helppy.web.mui.btn;

import helppy.web.lang.view.LangLabel;
import helppy.web.mui.label.HintedLabel;
import mui.common.Color;
import mui.core.Button;
import mui.core.Typography.TypographyVariant;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef GroupButtonProps = 
{
	?textId: String,
	?hintTextId: String,
	?alwaysShowHint: Bool,
	?name: String,
	?disabled: Bool,
	?children: Any,
	?onClick: Void -> Void,
}

@:jsxStatic('render')
class GroupButton 
{
	static final useStyle = makeStyles(
	{
		label:
		{
			color: "inherit"
		}
	});
	
	public static function render(props: GroupButtonProps) 
	{
		final classes = useStyle();
		return jsx('
			<$Button className=${"".addStyle(props)}
				name=${props.name}
				variant=${ButtonVariant.Outlined} 
				size=${ButtonSize.Small}
				color=${Color.Primary}
				disabled=${props.disabled}
				onClick=${props.onClick}>
				<$HintedLabel className=${classes.label}
					typographyVariant=${TypographyVariant.Button_}
					alwaysShowHint=${props.alwaysShowHint}
					textId=${props.textId}
					tooltipTitle=${getTooltipTitle(props.hintTextId)} />
				${props.children}
			</$Button>
		');
	}	

	static inline function getTooltipTitle(textId: String) 
	{
		return jsx('<$LangLabel	textId=${textId} />');
	}
}