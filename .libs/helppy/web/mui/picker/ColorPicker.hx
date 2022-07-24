package helppy.web.mui.picker;

import css.AlignItems;
import css.JustifyContent;
import css.Position;
import helppy.core.lang.Language;
import helppy.core.lang.data.LocaleItemData;
import helppy.web.lang.view.LangLabel;
import helppy.web.mui.hint.HintIcon;
import js.html.HtmlElement;
import js.html.InputElement;
import mui.common.Color;
import mui.core.Box;
import mui.core.FormControl;
import mui.core.IconButton;
import mui.core.TextField;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import mui.icons.Check;
import mui.icons.Clear;
import mui.icons.DeleteOutline;
import mui.icons.IconProps.SvgIconFontSize;
import mui.icons.Palette;
import mui.pickers.SketchPicker;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.types.event.SyntheticEvent.KeyboardEvent;
using helppy.core.lang.LangManager;
using helppy.web.util.CssUtil;

typedef ColorPickerProps =
{
	value: String,
	label: LocaleItemData,
	?name: String,
	onChange: String -> Void,
	?onReset: () -> Void
}

typedef ColorPickerState =
{
	color: String,
	opened: Bool
}

class ColorPicker extends ReactComponentOfPropsAndState<ColorPickerProps, ColorPickerState>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		container:
		{
			position: Position.Relative
		},
		title:
		{
			color: theme.palette.grey._600
		},
		picker:
		{
			backgroundColor: theme.palette.common.white,
			border: '1px solid ${theme.palette.grey._300}',
			borderRadius: theme.spacing(0.5),
			position: Position.Fixed,
			zIndex: 1
		},
		actions:
		{
			display: 'flex',
			justifyContent: JustifyContent.SpaceBetween,
			borderTop: '1px solid ${theme.palette.grey._300}'
		},
		palette:
		{
			marginLeft: theme.spacing(1.5)
		},
		preview:
		{
			width: theme.spacing(3),
			height: theme.spacing(2.75),
			backgroundColor: untyped props -> props.value != '' ? props.value : 'white',
			border: '1px solid ${theme.palette.grey._400}',
			borderRadius: theme.spacing(0.5)
		}
	});

	var _textField: HtmlElement;

	public function new() 
	{
		super(props);
		state = { color: "#000", opened: false };
	}

	override function render()
	{
		return jsx('<$ColorPickerImpl />');
	}

	function ColorPickerImpl()
	{
		final classes = useStyle();
		return jsx('
			<$Box className=${classes.container.addStyle(props)}>
				<$TextField value=${props.value}
					fullWidth=${true}
					name=${props.name}
					label=${jsx('<$LangLabel localItemData=${props.label} />')}
					variant=${FormControlVariant.Outlined}
					InputProps=${{
						endAdornment: jsx('<$EndAdornment />'),
					}}
					ref=${onGetTextFieldRef}
					onChange=${onInputChange} />
				<$ColorPickerForm />
			</$Box>
		');
	}

	function EndAdornment()
	{
		final classes = useStyle(props);
		final onClick = () -> setState({ color: props.value, opened: !state.opened });
		return jsx('
			<$Box display="flex"
				alignItems=${AlignItems.Center}>
				<$Box className=${classes.preview}></$Box>
				<$HintIcon textId="selectColor">
					<$IconButton className=${classes.palette}
						name=${"selectColor".getTextByLanguage(Language.RU)}
						size=${IconButtonSize.Small}
						onClick=${onClick}>
						<$Palette fontSize=${SvgIconFontSize.Small} />
					</$IconButton>
				</$HintIcon>
				<$ResetButton />
			</$Box>
		');
	}	

	function ResetButton()
	{
		return if (props.onReset == null)
			null;
		else
			jsx('
				<$HintIcon textId="reset">
					<$IconButton onClick=${props.onReset}
						name=${"reset".getTextByLanguage(Language.RU)}
						size=${IconButtonSize.Small}>
						<$DeleteOutline fontSize=${SvgIconFontSize.Small} />
					</$IconButton>
				</$HintIcon>
			');
	}

	function ColorPickerForm()
	{
		final classes = useStyle();
		return if (state.opened)
		{
			final boundingClientRect = _textField.getBoundingClientRect();
			jsx('
				<$Box className=${classes.picker}
					top=${boundingClientRect.y + boundingClientRect.height + 5}
					left=${boundingClientRect.x}>
					<$SketchPicker color=${state.color}
						onChange=${(color: ColorData) -> setState({ color: color.hex.toUpperCase() })} />
					<$Box className=${classes.actions}>
						<$IconButton color=${Color.Primary}
							size=${IconButtonSize.Small}
							onClick=${onColorConfirm}>
							<$Check fontSize=${SvgIconFontSize.Small} />
						</$IconButton>
						<$IconButton color=${Color.Primary}
							size=${IconButtonSize.Small}
							onClick=${onPickerClose}>
							<$Clear fontSize=${SvgIconFontSize.Small} />
						</$IconButton>
					</$Box>
				</$Box>
			');
		}
		else
		{
			null;
		};
	}

	function onInputChange(e: KeyboardEvent<InputElement>)
	{
		props.onChange(e.target.value);
	}

	function onPickerClose()
	{
		setState({ opened: false });
	}

	function onColorConfirm()
	{
		onPickerClose();
		props.onChange(state.color);
	}

	function onGetTextFieldRef(el: HtmlElement)
	{
		if (el != null)
			_textField = el;
	}
}