package api;

enum abstract CmdStatus(String) to String
{
	var OK = "OK";
	var DENIED = "DENIED";
}