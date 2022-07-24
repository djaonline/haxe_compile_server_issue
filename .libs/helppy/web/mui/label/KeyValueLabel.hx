package helppy.web.mui.label;

import helppy.core.lang.Language;
import helppy.web.lang.view.LangLabel;
import helppy.web.ui.char.Chars.*;
import mui.core.Typography;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent.ReactElement;
import react.ReactMacro.jsx;

using helppy.core.lang.LangManager;
using helppy.web.util.CssUtil;

typedef KeyValueLabelProps = 
{
	?keyTextId: String,
	?keyComp: ReactElement,
	?valueText: String,
	?valueComp: ReactElement
}

@:jsxStatic('render')
class KeyValueLabel 
{
	static final useStyle = makeStyles((theme: DefaultTheme) -> 
	{
		span:
		{
			display: 'inline',
			fontWeight: theme.typography.fontWeightMedium
		}
	});

	public static function render(props: KeyValueLabelProps) 
	{
		final classes = useStyle();
		final key = if (props.keyComp != null)
			props.keyComp;
		else
			jsx('<$LangLabel textId=${props.keyTextId} />');
		final value = if (props.valueText != null && props.valueText != "")
			props.valueText;
		else if (props.valueComp != null)
			cast props.valueComp;
		else
			null;
		return jsx('
			<$Typography className=${"".addStyle(props)}
				variant=${TypographyVariant.Body1}
				gutterBottom=${true}>
				<span className=${classes.span}>
					${key}
					:&nbsp;
				</span>
				<span name=${props.keyTextId.getTextByLanguage(Language.RU)}>
					${value != null ? value : cast DASH}
				</span>
			</$Typography>
		');
	}
}