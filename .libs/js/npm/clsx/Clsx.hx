package js.npm.clsx;

import haxe.extern.Rest;

@:jsRequire("clsx")
extern class Clsx 
{
    @:selfCall static function combine(args: Rest<Dynamic>): String;
}