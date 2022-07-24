package js.npm.sockjs.server;

@:jsRequire("sockjs")
extern class SockJS 
{
	static function createServer(?options: Dynamic): SockJSServer;
}

extern class SockJSServer
{
	function on(message: ConnectionMessage, handler: Connection -> Void): Void;
	function installHandlers(handler: Dynamic, opt: Dynamic): Void;
}

extern class Connection
{
	var id: String;
	function write(message: String): Void;
	function on(message: String, handler: Dynamic -> Void): Void; 
}

@:enum
abstract ConnectionMessage(String)
{
	var connection = "connection";
}