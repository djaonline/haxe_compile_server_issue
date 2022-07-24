package helppy.web.mui.btn;

import helppy.core.lang.Language;
import helppy.web.mui.label.HintedLabel;
import mui.common.Color;
import mui.core.Button;
import mui.core.LinearProgress;
import mui.core.Typography.TypographyVariant;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;
import ru.prime.widgetengine.data.form.FormAction;

using helppy.core.lang.LangManager;

typedef ActionButtonsProps = 
{
	actions: Array<FormAction>,
	onAction: (action: String) -> Void,
	loading: Bool
}

@:jsxStatic('render')
class ActionButtons 
{
	static final useStyle = makeStyles((theme: DefaultTheme) -> 
	{
		button: 
		{
			marginBottom: theme.spacing(1),
			padding: theme.spacing(0.75, 2)
		},
		label:
		{
			color: "inherit"
		}
	});

	public static function render(props: ActionButtonsProps) 
	{
		return jsx('
			<>
				<$Btns {...props} />
				<$Preloader loading=${props.loading} />
			</>
		');	
	}

	static function Preloader(props: { loading: Bool }) 
	{
		return props.loading ?jsx('<$LinearProgress />') : null;
	}

	static function Btns(props: ActionButtonsProps) 
	{
		final classes = useStyle();
		final btns = [];
		final disabled = props.loading;
		for (i in 0 ... props.actions.length)
		{
			final action = props.actions[i];
			final color = switch i
			{
				case 0: Color.Primary;
				case 1: Color.Secondary;
				default: Color.Default;
			}
			final btn = jsx('
				<$Button key=${action.action}
					name=${action.title.getTextByLocaleItem(Language.RU)}
					className=${classes.button}
					onClick=${() -> { props.onAction(action.action); }}
					disabled=${disabled} 
					variant=${ButtonVariant.Contained} 
					color=${color}  
					fullWidth=${true}>
					<$HintedLabel className=${classes.label}
						typographyVariant=${TypographyVariant.Button_}
						localItemData=${action.title} />
				</$Button>
			');
			btns.push(btn);
		}
		return btns;
	}
}
