package mui.core;

import react.transition.Transition.TransitionProps;

enum abstract PopperPlacement(String) to String 
{
	var BottomEnd = 'bottom-end';
	var BottomStart = 'bottom-start';
	var Bottom = 'bottom';
	var LeftEnd = 'left-end';
	var LeftStart ='left-start';
	var Left = 'left';
	var RightEnd = 'right-end';
	var RightStart ='right-start';
	var Right = 'right';
	var TopEnd = 'top-end';
	var TopStart = 'top-start';
	var Top = 'top';
}

typedef PopperRenderProps = 
{
	placement: PopperPlacement,
	?TransitionProps: TransitionProps<Any>
}

@:pure @:coreType abstract PopperRenderProp
	from PopperRenderProps -> ReactFragment
	from ReactFragment
	from ReactSingleFragment
	from Array<ReactFragment>
	from Array<ReactElement>
	from Array<ReactSingleFragment> {}

typedef PopperProps =
{
	>StandardDOMAttributes,
	children: PopperRenderProp,
	open: Bool,
	anchorEl: DOMOrCallback,
	container: DOMOrCallback,
	disablePortal: Bool,
	keepMounted: Bool,
	modifiers: Dynamic,
	placement: PopperPlacement,
	popperOptions: Dynamic,
	popperRef: ReactRef<Any>,
	transition: Bool
}

@:jsRequire('@material-ui/core', 'Popper')
extern class Popper extends ReactComponentOfProps<PopperProps>
{
}

