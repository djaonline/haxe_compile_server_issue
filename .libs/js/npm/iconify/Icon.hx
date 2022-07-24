package js.npm.iconify;

import react.ReactComponent;

enum abstract Flip(String) 
{
	var	Horizontal = "horizontal";
	var	Vertical = "vertical";
	var	HorVert = "horizontal,vertical";
}

enum abstract Rotate(Dynamic) 
{
	var One = 1;
	var Two = 2;
	var Three = 3;
	var Deg90 = "90deg";
	var Deg180 = "180deg";
	var Deg270 = "270deg";
}

typedef IconProps = 
{
	icon: Any,
	?width: String,
	?height: String,
	?hFlip: Bool,
	?vFlip: Bool,
	?flip: Flip,
	?rotate: Rotate,
	?color: String,
	?align: String
}

@:jsRequire('@iconify/react', 'Icon')
extern class Icon extends ReactComponentOfProps<IconProps>
{
}