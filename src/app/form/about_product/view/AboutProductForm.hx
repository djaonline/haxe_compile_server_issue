package app.form.about_product.view;

import app.main.page.view.common.Logo;
import component.loader.Preloader;
import helppy.core.data.settings.FormatSettings;
import helppy.core.macro.ver.Version;
import helppy.web.lang.view.LangLabel;
import helppy.web.mui.label.FormLabel;
import info.settings.Settings;
import mui.core.Box;
import mui.core.Typography;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent;
import react.ReactFragment;
import redux.react.IConnectedComponent;
import ru.prime.widgetengine.data.info.ComponentData;

using LocaleMap;

typedef AboutProductFormState =
{
	components: Array<ComponentData>,
	loading: Bool
} 

class AboutProductForm 
	extends ReactComponentOfState<AboutProductFormState>
	implements IConnectedComponent
{
	static final useStyle = makeStyles((theme: DefaultTheme) -> 
	{
		configuration:
		{
			marginBottom: theme.spacing(1)
		},
		service:
		{
			display: 'block',
			marginBottom: theme.spacing(0.625)
		},
		copyright:
		{
			display: 'block',
			color: theme.palette.grey._500,
			marginTop: theme.spacing(3),
			lineHeight: 1.5
		}
	});

	function mapState(appState: ApplicationState, _)
	{
		final aboutProductState = appState.aboutProductState;
		return
		{
			components: aboutProductState.components,
			loading: aboutProductState.loading
		}
	}

	override function render()
	{
		return if (state.loading)
			jsx('<$Preloader />');
		else 
			jsx('<$Form />');
	}

	function Form() 
	{
		final classes = useStyle();
		final buildTime = Version.getBuildTime();
		final pomVersion = Version.getPomVersion("pom.xml");
		final copyrightYear = Settings.getCopyrightYear();
		return jsx('
			<>
				<$Box marginBottom=${3}>
					<$LogoRenderer />
				</$Box>
				<$FormLabel className=${classes.configuration}
					textId="configuration"
					bold=${true} />
				<$Typography className=${classes.service}
					name=${"webClientBankEmployee".getText()}
					variant=${TypographyVariant.Body1}
					gutterBottom=${true}>
					<$LangLabel textId="webClientBankEmployee" /> 
					<$LangLabel name="Версия" 
						text=${'v.${pomVersion}'} /> 
					<$LangLabel name="Дата сборки" 
						text=${'(${buildTime})'} />
				</$Typography>
				${getConf()}
				<$Typography className=${classes.copyright}
					variant=${TypographyVariant.Body2}
					gutterBottom=${false}>
					<$LangLabel textId="copyright" />
					, ${copyrightYear}
					<br />
					<$LangLabel textId="legalNote" />
				</$Typography>
			</>
		');
	}

	function LogoRenderer(): ReactFragment
	{
		#if (target == 'primebox')
			return jsx('<$Logo color=${ColorTheme.primaryColor} />');
		#else
			return null;
		#end
	}

	function getConf(): Array<ReactFragment>
	{
		final classes = useStyle();
		if (state.components == null) return null;
		var items: Array<ReactFragment> = [];
		for (i in 0...state.components.length) 
		{
			final component = state.components[i];
			final buildDate = component.buildDate.format(FormatSettings.DD_MM_YYYY_HH_MM_SS);
			items.push(
				jsx('
					<$Typography className=${classes.service}
						name=${component.name.ru}
						key=${i}
						variant=${TypographyVariant.Body1}
						gutterBottom=${true}>
						<$LangLabel localItemData=${component.name} /> 
						<$LangLabel name="Версия" 
							text=${'v.${component.version}'} /> 
						<$LangLabel name="Дата сборки" 
							text=${'(${buildDate})'} />
					</$Typography>
				')
			);
		}
		return items;
	}
}