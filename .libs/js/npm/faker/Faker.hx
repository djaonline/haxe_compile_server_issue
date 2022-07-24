package js.npm.faker;

@:jsRequire("faker")
extern class Faker 
{
	public static var random(default, null): Random; 
	public static var lorem(default, null): Lorem; 
	public static var finance(default, null): Finance; 
	public static var name(default, null): Name;
	public static var internet(default, null): Internet;
}

typedef Random = 
{
	function word(): String; 
}

typedef Lorem = 
{
	function sentence(): String;
	function sentences(count: Int): String; 
}

typedef Finance = 
{
}

typedef Name = 
{
	function firstName(): String;
	function lastName(): String;
}

typedef Internet = 
{
	function email(): String;
}