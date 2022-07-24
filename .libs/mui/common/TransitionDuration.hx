package mui.common;

typedef OTransitionDuration = 
{
	var ?enter:Int;
	var ?exit:Int;
}

typedef OTimeoutTransitionDuration = {
	> OTransitionDuration,
	var ?appear:Int;
}

@:coreType
abstract TransitionDuration from Int from OTransitionDuration {}

@:coreType
enum abstract TransitionDurationOrAuto from Int from OTransitionDuration 
{
	var Auto = cast "auto";
}

@:coreType
abstract TimeoutTransitionDuration from Int from OTimeoutTransitionDuration {}
