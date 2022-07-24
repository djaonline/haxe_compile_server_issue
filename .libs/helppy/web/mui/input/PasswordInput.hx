package helppy.web.mui.input;

import helppy.core.lang.data.LocaleItemData;
import helppy.web.lang.view.LangLabel;
import helppy.web.mui.hint.HintIcon;
import mui.core.FormControl;
import mui.core.IconButton;
import mui.core.InputAdornment;
import mui.core.TextField;
import mui.core.input.InputType;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import mui.icons.Visibility;
import mui.icons.VisibilityOff;
import react.ReactComponent;
import react.ReactKeyboardEvent;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef PasswordInputProps =
{
	?textId: String,
	?localItemData: LocaleItemData,
	?value: String,
	?name: String,
	?disabled: Bool,
	?size: FormControlSize,
	?variant: FormControlVariant,
	?maxLength: Int,
	?error: Bool,
	?required: Bool,
	?onChange: (event: ReactKeyboardEvent) -> Void
} 

typedef PasswordInputState = 
{
	canSee: Bool
}

class PasswordInput extends ReactComponentOfPropsAndState<PasswordInputProps, PasswordInputState>
{
	static final useStyles = makeStyles((theme: DefaultTheme) -> 
	{
		error: 
		{
			margin: theme.spacing(1, 0, 1, 0)
		}
	});

	public function new() 
	{
		super(props);
		state = { canSee:  false };	
	}

	override function render()
	{
		return jsx('<$Input />');
	}

	function Input()
	{
		return jsx('
			<$TextField className=${"".addStyle(props)}
				value=${props.value}
				name=${props.name}
				disabled=${props.disabled}
				error=${props.error}
				required=${props.required}
				fullWidth=${true}
				type=${state.canSee ? InputType.Text : InputType.Password}
				onChange=${props.onChange}
				label=${jsx('
					<$LangLabel textId=${props.textId} 
						localItemData=${props.localItemData} />
				')}
				variant=${props.variant}
				size=${props.size}
				InputProps=${getPasswordIconProps()}
				inputProps=${{ maxLength: props.maxLength }} />
		');
	}

	function onIconMouseDown(_) 
	{
		setState({ canSee: true });
	}

	function onIconMouseUp(_) 
	{
		setState({ canSee: false });
	}

	function getPasswordIconProps() 
	{
		final visibilityIcon = state.canSee ? jsx('<$Visibility />') : jsx('<$VisibilityOff />');
		return 
		{
			endAdornment: jsx('
				<$InputAdornment position=${InputAdornmentPosition.End}
					name="Видимость пароля">
					<$HintIcon textId=${state.canSee ? "hide" : "show"}>
						<$IconButton disabled=${props.disabled}
							onMouseDown=${onIconMouseDown}
							onMouseUp=${onIconMouseUp}
							onMouseLeave=${onIconMouseUp}
							edge=${InputAdornmentPosition.End}>
							${visibilityIcon}
						</$IconButton>
					</$HintIcon>
				</$InputAdornment>
			')
		}
	}
}