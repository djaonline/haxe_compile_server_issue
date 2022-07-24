package js.npm.anime;

@:jsRequire("animejs")
extern class Anime 
{	
 	@:selfCall function new(param: Dynamic);
	function play(): Void;
	function reverse(): Void;
}