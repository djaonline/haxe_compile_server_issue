package helppy.web.mui.select;

import helppy.core.data.ui.ItemData;
import helppy.core.lang.LangManager;
import helppy.core.lang.data.LocaleItemData;
import helppy.web.lang.view.LangLabel;
import js.html.HtmlElement;
import js.html.InputElement;
import mui.core.FormControl;
import mui.core.InputLabel;
import mui.core.MenuItem;
import mui.core.Select.SelectClassProps;
import mui.core.Select;
import mui.core.Tooltip;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.types.SyntheticEvent.ChangeEvent;
using helppy.web.util.CssUtil;

typedef SelectInputProps = 
{
	value: String,
	items: Array<ItemData>,
	?name: String,
	?label: LocaleItemData,
	?labelId: String,
	?error: Bool,
	?size: FormControlSize,
	?disabled: Bool,
	?required: Bool,
	?variant: FormControlVariant,
	?selectClasses: SelectClassProps<String>,
	?disableUnderline: Bool,
	onChange: String -> Void
}

typedef SelectInputState = 
{
	showTooltip: Bool
}

class SelectInput extends ReactComponentOfPropsAndState<SelectInputProps, SelectInputState>
{
	var _select: HtmlElement;

	static final useStyles = makeStyles((theme: DefaultTheme) -> 
	{
		emptyItem:
		{
			color: theme.palette.grey._400
		}
	});

	public function new(props: SelectInputProps) 
	{
		super(props);
		state = { showTooltip: false };
	}

	override function render()
	{
		return jsx('<$Input />');
	}

	function Input()
	{
		final classes = useStyles();
		final emptyItem = if (!props.required)
			jsx('
				<$MenuItem className=${classes.emptyItem} value=${null}>
					<$LangLabel textId="none" />
				</$MenuItem>
			');
		else
			null;
		return jsx('
			<$Tooltip title=${getTitle()}
				open=${state.showTooltip && isTruncatedValue()}>
				<$FormControl className=${"".addStyle(props)}
					size=${props.size}
					name=${props.name}
					disabled=${props.disabled}
					error=${props.error}
					variant=${props.variant}
					fullWidth=${true}
					onMouseEnter=${openTooltip}
					onMouseLeave=${closeTooltip}>
					<$InputLabel id=${"label_" + props.name}
						required=${props.required}>
						<$LangLabel textId=${props.labelId}
							localItemData=${props.label} />
					</$InputLabel>
					<$Select classes=${props.selectClasses}
						disableUnderline=${props.disableUnderline}
						labelId=${"label_" + props.name}
						id=${"select_" + props.name}
						value=${props.value == null ? "" : props.value}
						ref=${onContainerGetRef}
						onOpen=${closeTooltip}
						onChange=${onChange}>
						${emptyItem}
						${getItems()}
					</$Select>
				</$FormControl>
			</$Tooltip>
		');
	}

	function getItems()
	{
		return
		[
			for (i in 0...props.items.length) 
			{
				final item = props.items[i];
				jsx('
					<$MenuItem key=${Std.string(i)} 
						value=${item.id}>
						<$LangLabel textId=${item.textId}
							text=${item.text}
							localItemData=${item.localeItemData} />
					</$MenuItem>
				');
			}
		];
	}

	function getTitle(): String
	{
		for (i in 0...props.items.length) 
		{
			final item = props.items[i];
			if (item.id == props.value)
			{
				return if (item.text != null) 
					item.text;
				else if (item.textId != null)
					LangManager.getText(item.textId);
				else
					LangManager.getTextByLocaleItem(item.localeItemData);
			}
		}
		return "";
	}

	function openTooltip()
	{
		setState({ showTooltip: true });
	}

	function closeTooltip()
	{
		setState({ showTooltip: false });
	}

	function isTruncatedValue(): Bool
	{
		return if (_select != null)
			_select.getBoundingClientRect().width <= _select.getElementsByTagName("span")[0].getBoundingClientRect().width + 16;
		else
			false;
	}

	function onChange(e: ChangeEvent<InputElement>)
	{
		props.onChange(e.target.value);
	}

	function onContainerGetRef(e: HtmlElement)
	{
		_select = e;
	}

	override function componentDidUpdate(prevProps: SelectInputProps, prevState: SelectInputState) 
	{
		if (prevProps.disabled != props.disabled && _select != null)
		{
			updateDisabledAttribute();
		}
	}
	
	override function componentDidMount() 
	{
		updateDisabledAttribute();
	}

	function updateDisabledAttribute()
	{
		if (_select != null)
		{
			final input = _select.getElementsByTagName("input")[0];
			if (props.disabled)
			{
				input.setAttribute("data-test-disabled", "true");
			}
			else
			{
				input.removeAttribute("data-test-disabled");
			}
		}
	}
}