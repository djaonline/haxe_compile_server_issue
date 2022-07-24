package js.npm.sha;

@:jsRequire("jssha")
extern class JsSha 
{
	public function new(alg : Alg, input: InputType): Void;
	public function update(data: String): Void;
	public function getHash(out: OutputType): String;
}

@:enum
abstract Alg(String)
{
	var SHA256 = "SHA-256";
}

@:enum
abstract InputType(String)
{
	var TEXT = "TEXT";
}

@:enum
abstract OutputType(String)
{
	var HEX = "HEX";
}