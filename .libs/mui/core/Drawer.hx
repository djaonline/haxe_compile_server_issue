package mui.core;

import mui.core.Modal.ModalProps;
import mui.core.Paper.PaperProps;
import mui.core.Slide.SlideProps;

enum abstract DrawerAnchor(String) to String 
{
	var Left = "left";
	var Top = "Top";
	var Right = "right";
	var Bottom = "bottom";
}

enum abstract DrawerVariant(String) to String 
{
	var Permanent = "permanent";
	var Persistent = "persistent";
	var Temporary = "temporary";
}

typedef DrawerClassProps<T> = 
{
	?docked: T,
	?paper: T,
	?paperAnchorLeft: T,
	?paperAnchorRight: T,
	?paperAnchorTop: T,
	?paperAnchorBottom: T,
	?paperAnchorDockedLeft: T,
	?paperAnchorDockedTop: T,
	?paperAnchorDockedRight:T,
	?paperAnchorDockedBottom: T,
	?modal: T,
};

typedef DrawerProps = 
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: DrawerClassProps<String>,
	?anchor: DrawerAnchor,
	?elevation: Int,
	?ModalProps: Partial<ModalProps>,
	?onClose: HandlerOrVoid<ClassicHandler>,
	?open: Bool,
	?PaperProps: Partial<PaperProps>,
	?SlideProps: Partial<SlideProps>,
	?transitionDuration: TransitionDuration,
	?variant: DrawerVariant
};

@:jsRequire('@material-ui/core', 'Drawer')
extern class Drawer extends ReactComponentOfProps<DrawerProps>
{
}

