package mui.core;

import mui.common.TransitionDuration.TransitionDurationOrAuto;
import mui.core.Modal.ModalProps;
import mui.core.Paper.PaperProps;
import react.transition.Transition.TransitionProps;

typedef AnchorPosition = 
{
	var left:Int;
	var top:Int;
}

enum abstract AnchorReference(String) 
{
	var AnchorEl = "anchorEl";
	var AnchorPosition = "anchorPosition";
	var None = "none";
}

typedef PopoverActions = 
{
	var updatePosition: Void -> Void;
}

typedef PopoverClassProps<T> = 
{
	?root: T,
	?paper: T,
}

typedef PopoverProps = ForcedOverride<ModalProps, 
{
	?action: PopoverActions->Void,
	?anchorEl: DOMOrCallback,
	?anchorOrigin: Position,
	?anchorPosition: AnchorPosition,
	?anchorReference: AnchorReference,
	?children: ReactFragment,
	?classes: PopoverClassProps<String>,
	?elevation: Int,
	?getContentAnchorEl: Void->DOMElement,
	?marginThreshold: Int,
	?onEnter: CallbackOrVoid<DOMElement->Bool->Void>,
	?onEntering: CallbackOrVoid<DOMElement->Bool->Void>,
	?onEntered: CallbackOrVoid<DOMElement->Bool->Void>,
	?onExit: CallbackOrVoid<DOMElement->Void>,
	?onExiting: CallbackOrVoid<DOMElement->Void>,
	?onExited: CallbackOrVoid<DOMElement->Void>,
	?PaperProps: Partial<PaperProps>,
	?transformOrigin: Position,
	?TransitionComponent: ReactType,
	?transitionDuration: TransitionDurationOrAuto,
	?TransitionProps: TransitionProps<Any>,
}>

@:jsRequire('@material-ui/core', 'Popover')
extern class Popover extends ReactComponentOfProps<PopoverProps>
{
}

