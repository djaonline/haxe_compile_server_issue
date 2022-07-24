package js.npm.react_tooltip;

typedef ReactTooltipProps = 
{
	?id: String,
	?place: PlaceType,
	?type: TooltipType,
	?effect: EffectType
}

@:jsRequire("react-tooltip")
extern class ReactTooltip extends react.ReactComponent.ReactComponentOfProps<ReactTooltipProps>
{
}

extern enum abstract PlaceType(String) 
{
	var Top = "top";
	var Right = "right";
	var Bottom = "bottom";
	var Left = "left";
}

extern enum abstract TooltipType(String) 
{
	var Dark = "dark";
	var Success = "success";
	var Light = "light";
}

extern enum abstract EffectType(String) 
{
	var Float = "float";
	var Solid = "solid";
}