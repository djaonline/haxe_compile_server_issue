package helppy.web.mui.switcher;

import css.AlignItems;
import lib.core.lang.data.LocaleItemData;
import js.html.InputElement;
import mui.common.Color.ColorPS;
import mui.core.Box;
import mui.core.FormControl;
import mui.core.FormControlLabel;
import mui.core.Switch as MuiSwitch;
import mui.core.Typography;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;
import react.types.SyntheticEvent.ChangeEvent;

using helppy.web.util.CssUtil;

typedef SwitcherProps =
{
	?textId: String,
	?text: String,
	?localeItemData: LocaleItemData,
	?name: String,
	?checked: Bool,
	?disabled: Bool,
	?size: FormControlSize,
	?onChange: (checked: Bool) -> Void,
}

@:jsxStatic('render')
class Switcher
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		container:
		{
			display: "flex",
			alignItems: AlignItems.Center
		},
		control:
		{
			marginLeft: 0
		},
		input:
		{
			marginRight: theme.spacing(0.75)
		}
	});

	public static function render(props: SwitcherProps)
	{
		function onChange(e: ChangeEvent<InputElement>) 
		{
			if (props.onChange != null)
				props.onChange(e.target.checked);
		}
		
		final classes = useStyle();
		return jsx('
			<$Box className=${classes.container.addStyle(props)}
				name=${props.name}>
				<$FormControlLabel className=${classes.control}
					control=${jsx('
						<$MuiSwitch className=${classes.input}
							name=${props.name}
							checked=${props.checked}
							disabled=${props.disabled}
							size=${props.size}
							onChange=${onChange}
							color=${ColorPS.Primary} />
					')}
					label=${jsx('
						<$Typography variant=${TypographyVariant.Body1}
							gutterBottom=${false}>
						</$Typography>
					')} />
			</$Box>
		');
	}
}
