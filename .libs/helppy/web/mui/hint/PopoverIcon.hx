package helppy.web.mui.hint;

import css.AlignItems;
import css.PointerEvents;
import helppy.web.lang.view.LangLabel;
import js.html.EventTarget;
import mui.common.IconColor;
import mui.core.Popover as MUIPopover;
import mui.core.Typography;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import mui.icons.ErrorOutline as ErrorOutlineIcon;
import react.PureComponent;
import react.ReactEvent;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef PopoverIconProps =
{
	textId: String,
	?className: String,
	?disabled: Bool
}

typedef PopoverIconState =
{
	anchorEl: EventTarget
}

class PopoverIcon extends PureComponentOfPropsAndState<PopoverIconProps, PopoverIconState>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		icon:
		{
			display: 'flex',
			alignItems: AlignItems.Center,
			transform: 'rotate(180deg)',
			cursor: 'default'
		},
		popover: 
		{
			pointerEvents: PointerEvents.None,
		},
		paper: 
		{
			backgroundColor: theme.palette.secondary.main,
			boxShadow: 'none',
			padding: theme.spacing(1),
			marginTop: theme.spacing(0.5)
		},
		text:
		{
			color: theme.palette.primary.main,
			maxWidth: '200px',
			lineHeight: '16px'
		}
	});

	public function new() 
	{
		super(props);
		state = { anchorEl: null };
	}
	
	override function render()
	{
		return jsx('<$Renderer />');
	}

	function Renderer()
	{
		final classes = useStyle();
		final open = state.anchorEl != null;
		return jsx('
			<div className=${"".addStyle(props)}>
				<div className=${classes.icon} 
					onMouseEnter=${onOpen}
					onMouseLeave=${onClose}>
					<$ErrorOutlineIcon color=${props.disabled ? IconColor.Disabled : IconColor.Primary} />
				</div>
				<$MUIPopover className=${classes.popover}
					classes=${{ paper: classes.paper }}
					open=${props.disabled ? false : open}
					anchorEl=${state.anchorEl}
					anchorOrigin=${{
						vertical: 'bottom',
						horizontal: 'center',
					}}
					transformOrigin=${{
						vertical: 'top',
						horizontal: 'center',
					}}
					onClose=${onClose}>
					<$Typography className=${classes.text}
						variant=${TypographyVariant.Body2}>
						<$LangLabel textId=${props.textId} />
					</$Typography>
				</$MUIPopover>
			</div>
		');
	}

	function onOpen(e: ReactEvent)
	{
		setState({ anchorEl: e.currentTarget });
	}

	function onClose()
	{
		setState({ anchorEl: null });
	}
}
