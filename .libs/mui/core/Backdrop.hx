package mui.core;

import mui.common.TransitionDuration.TimeoutTransitionDuration;

typedef BackdropClassProps<T> = 
{
	?root: T,
	?invisible: T
}

typedef BackdropProps = 
{
	open: Bool,
	?children: ReactFragment,
	?classes: BackdropClassProps<String>,
	?invisible: Bool,
	?transitionDuration: TimeoutTransitionDuration
}

@:jsRequire('@material-ui/core', 'Backdrop')
extern class Backdrop extends ReactComponentOfProps<BackdropProps>
{
}
