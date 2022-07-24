package mui.core;

import mui.core.Backdrop.BackdropProps;
import mui.core.ModalManager;

enum abstract ModalCloseReason(String) 
{
	var EscapeKeyDown = "escapeKeyDown";
	var BackdropClick = "backdropClick";
}

typedef ModalProps = 
{
	> StandardDOMAttributes,
	children: ReactSingleFragment,
	open: Bool,
	?BackdropComponent: ReactType,
	?BackdropProps: Partial<BackdropProps>,
	?closeAfterTransition: Bool,
	?container: DOMOrCallback,
	?disableAutoFocus: Bool,
	?disableBackdropClick: Bool,
	?disableEnforceFocus: Bool,
	?disableEscapeKeyDown: Bool,
	?disablePortal: Bool,
	?disableRestoreFocus: Bool,
	?disableScrollLock: Bool,
	?hideBackdrop: Bool,
	?keepMounted: Bool,
	?manager: ModalManager,
	?onBackdropClick: HandlerOrVoid<ClassicHandler>,
	?onClose: HandlerOrVoid<Event->ModalCloseReason->Void>,
	?onEscapeKeyDown: HandlerOrVoid<ClassicHandler>,
	?onRendered: HandlerOrVoid<ClassicHandler>
}

@:jsRequire('@material-ui/core', 'Modal')
extern class Modal extends ReactComponentOfProps<ModalProps> {}
