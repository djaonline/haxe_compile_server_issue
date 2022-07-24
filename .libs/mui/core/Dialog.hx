package mui.core;

import mui.common.Breakpoint.BreakpointOrFalse;
import mui.core.Modal.ModalProps;
import mui.core.Paper.PaperProps;
import react.transition.Transition.TransitionProps;

enum abstract DialogScrollContainer(String) to String 
{
	var Body = "body";
	var Paper = "paper";
}

typedef DialogClassProps<T> = 
{
	?root: T,
	?scrollPaper: T,
	?scrollBody: T,
	?container: T,
	?paper: T,
	?paperScrollPaper: T,
	?paperScrollBody: T,
	?paperWidthFalse: T,
	?paperWidthXs: T,
	?paperWidthSm: T,
	?paperWidthMd: T,
	?paperWidthLg: T,
	?paperWidthXl: T,
	?paperFullWidth: T,
	?paperFullScreen: T
}

typedef DialogProps = ForcedOverride<ModalProps, {
	children: ReactFragment,
	?classes: DialogClassProps<String>,
	?fullScreen: Bool,
	?fullWidth: Bool,
	?maxWidth: BreakpointOrFalse,
	?onEnter: CallbackOrVoid<DOMElement->Bool->Void>,
	?onEntering: CallbackOrVoid<DOMElement->Bool->Void>,
	?onEntered: CallbackOrVoid<DOMElement->Bool->Void>,
	?onExit: CallbackOrVoid<DOMElement->Void>,
	?onExiting: CallbackOrVoid<DOMElement->Void>,
	?onExited: CallbackOrVoid<DOMElement->Void>,
	?PaperComponent: ReactType,
	?PaperProps: Partial<PaperProps>,
	?scroll: DialogScrollContainer,
	?TransitionComponent: ReactType,
	?transitionDuration: TransitionDuration,
	?TransitionProps: TransitionProps<Any>
}>;

@:jsRequire('@material-ui/core', 'Dialog')
extern class Dialog extends ReactComponentOfProps<DialogProps>
{
}

