package mui.core;

import mui.core.Popper.PopperPlacement;
import mui.core.Popper.PopperProps;
import react.transition.Transition.TransitionProps;

typedef TooltipClassProps<T> = 
{
	?popper: T,
	?popperInteractive: T,
	?popperArrow: T,
	?tooltip: T,
	?tooltipArrow: T,
	?arrow: T,
	?touch: T,
	?tooltipPlacementLeft: T,
	?tooltipPlacementRight: T,
	?tooltipPlacementTop: T,
	?tooltipPlacementBottom: T
}

typedef TooltipProps = ForcedOverride<StandardDOMAttributes, 
{
	children: ReactElement,
	title: ReactFragment,
	?classes: TooltipClassProps<String>,
	?disableFocusListener: Bool,
	?disableHoverListener: Bool,
	?disableTouchListener: Bool,
	?enterDelay: Int,
	?enterTouchDelay: Int,
	?id: String,
	?interactive: Bool,
	?leaveDelay: Int,
	?leaveTouchDelay: Int,
	?onClose: HandlerOrVoid<ClassicHandler>,
	?onOpen: HandlerOrVoid<ClassicHandler>,
	?open: Bool,
	?placement: PopperPlacement,
	?PopperProps: Partial<PopperProps>,
	?TransitionComponent: ReactType,
	?TransitionProps: TransitionProps<Any>,
}>;

@:jsRequire('@material-ui/core', 'Tooltip')
extern class Tooltip extends ReactComponentOfProps<TooltipProps>
{
}

