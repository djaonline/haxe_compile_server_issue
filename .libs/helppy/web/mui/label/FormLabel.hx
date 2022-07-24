package helppy.web.mui.label;

import app.main.theme.ColorPallete;
import css.TextAlign;
import helppy.web.lang.view.LangLabel;
import mui.core.Typography;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

enum abstract FormLabelVariant(String)
{
	var DARK_GREY = "darkGrey";
	var GREY = "grey";
	var LIGHT_GREY = "lightGrey";
}

typedef FormLabelProps = 
{
	>LangLabelProps,
	?variant: FormLabelVariant,
	?typographyVariant: TypographyVariant,
	?bold: Bool,
	?children: Any,
	?addAsterisk: Bool,
	?textAlign: TextAlign,
	?gutterBottom: Bool
}

@:jsxStatic('render')
class FormLabel 
{
	static final useStyle = makeStyles(
	{
		darkGrey: 
		{
			color: ColorPallete.GREY_900
		},
		grey:
		{
			color: ColorPallete.GREY_700
		},
		lightGrey:
		{
			color: ColorPallete.GREY_500
		},
		bold: 
		{
			fontWeight: 500
		},
		textAlign: 
		{
			textAlign: untyped props -> props.textAlign
		}
	});
		
	public static function render(props: FormLabelProps) 
	{
		final classes = useStyle(props);
		var className = 
		switch props.variant
		{
			case DARK_GREY: classes.darkGrey;
			case GREY: classes.grey;
			case LIGHT_GREY: classes.lightGrey;
			default: classes.darkGrey;
		}
		if (props.bold)
			className = '${className} ${classes.bold}';
		if (props.textAlign != null)
			className = '${className} ${classes.textAlign}';  
		final typographyVariant = props.typographyVariant == null ? TypographyVariant.Body1 : props.typographyVariant;
		return jsx('
			<$Typography className=${className.addStyle(props)}
				name=${props.name}
				variant=${typographyVariant}
				gutterBottom=${props.gutterBottom}>
				<$LangLabel textId=${props.textId}
					text=${props.text}
					localItemData=${props.localItemData}
					params=${props.params} />
				${getTextBody(props.children, props.addAsterisk)}
			</$Typography>
		');
	}

	static inline function getTextBody(content: Any, addAsterisk: Bool)
	{
		final asterisk = addAsterisk ? jsx('<>&nbsp;*</>') : null;
		return jsx(
			<>
				${asterisk}
				${content}
			</>
		);
	}
}