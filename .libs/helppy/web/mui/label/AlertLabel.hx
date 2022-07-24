package helppy.web.mui.label;

import css.Position;
import helppy.core.lang.data.LocaleItemData;
import helppy.web.lang.view.LangLabel;
import mui.core.IconButton;
import mui.core.Typography;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import mui.icons.Close as CloseIcon;
import mui.lab.Alert;
import react.ReactMacro.jsx;

using LocaleMap;
using helppy.web.util.CssUtil;

typedef AlertLabelProps = 
{
	color: AlertColor,
	?children: Any,
	?name: String,
	?text: Any,
	?textId: String,
	?localeItemData: LocaleItemData,
	?params: Array<ParamData>,
	?closeBtn: Bool,
	?onClose: Void -> Void,
}

@:jsxStatic('render')
class AlertLabel
{
	static final useStyles = makeStyles((theme: DefaultTheme) -> 
	{
		container: 
		{
			position: Position.Relative
		},
		closeBtn: 
		{
			position: Position.Absolute,
			top: 0,
			right: 0
		},
		message:
		{
			paddingRight: untyped props -> props.closeBtn ? theme.spacing(1.5) : null
		},
		label:
		{
			color: "inherit",
			lineHeight: 1.25
		}
	});

	public static function render(props: AlertLabelProps) 
	{
		final classes = useStyles(props);
		return jsx('
			<div className=${classes.container.addStyle(props)}>
				<$Alert classes=${{ message: classes.message }}
					name=${props.name}
					severity=${props.color}>
					${props.children}
					<$Typography className=${classes.label}
						variant=${TypographyVariant.Body1}>
						<$LangLabel text=${props.text}
							textId=${props.textId}
							localItemData=${props.localeItemData}
							params=${props.params} />
					</$Typography>
					<$CloseBtn {...props} />
				</$Alert>
			</div>
		');
	}

	static function CloseBtn(props: AlertLabelProps) 
	{
		return if (props.closeBtn)
		{
			final classes = useStyles();
			jsx('	
				<$IconButton className=${classes.closeBtn} 
					name=${"close".getText()}
					size=${IconButtonSize.Small}
					onClick=${props.onClose}>
					<$CloseIcon />	
				</$IconButton>
			');
		}
		else 
			null;	
	}
}