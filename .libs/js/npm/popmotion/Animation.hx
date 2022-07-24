package js.npm.popmotion;

@:jsRequire('popmotion', 'animate')
extern class Animation 
{
	@:selfCall function new(opts: TweenOptions): Void;
	function stop(): Void;
}

typedef TweenOptions =
{
	?from: Dynamic,
	?to: Dynamic,
	?duration: Float,
	?elapsed: Dynamic,
	?ease: Easing,
	?repeate: Dynamic,
	?onUpdate: (currentValue: Dynamic) -> Void,
	?onPlay: Void -> Void,
	?onComplete: Void -> Void,
	?onRepeat: Void -> Void,
	?onStop: Void -> Void,
}