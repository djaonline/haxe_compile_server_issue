package mui.core;

typedef ClickAwayListenerProps = 
{
	children: ReactFragment,
	onClickAway: HandlerOrVoid<ClassicHandler>,
	?mouseEvent: ClickAwayMouseEvent,
	?touchEvent: ClickAwayTouchEvent,
}

enum abstract ClickAwayMouseEvent(Dynamic) 
{
	var Click = "onClick";
	var MouseDown = "onMouseDown";
	var MouseUp = "onMouseUp";
	var None = false;
}

enum abstract ClickAwayTouchEvent(Dynamic) 
{
	var TouchStart = "onTouchStart";
	var TouchEnd = "onTouchEnd";
	var None = false;
}

@:jsRequire('@material-ui/core', 'ClickAwayListener')
extern class ClickAwayListener extends ReactComponentOfProps<ClickAwayListenerProps>
{
}

