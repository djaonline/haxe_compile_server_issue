package js.npm.base64url;

import js.node.Buffer;
import haxe.extern.EitherType;

@:jsRequire("base64url")
extern class Base64Url 
{	
	// base64url encode input. Input should be a string or a Buffer.
	public static function encode(input: EitherType<String, Buffer>, encoding: String = "utf8"): String;
	
	// Convert a base64url encoded string into a raw string. 
	// The encoding argument can be used if the input is a string that's not utf8.
	public static function decode(input: String, encoding: String = "utf8"): String;
	
	// Convert a base64 encoded string to a base64url encoded string.
	public static function fromBase64(input: String): String;
	
	// Convert a base64url encoded string to a base64 encoded string.
	public static function toBase64(input: String): String;
}