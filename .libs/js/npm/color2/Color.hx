package js.npm.color2;

@:jsRequire("color2")
extern class Color 
{
    @:selfCall function new(val: Dynamic);
	function alpha(val: Float): Color;
	function clearer(val: Float): Color;
    function rgb():Color;
    function hsl():Color;
    function hexString():String;
    function lighten(perc: Float): Color;
	function rgbString(): String;
}