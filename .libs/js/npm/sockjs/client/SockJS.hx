package js.npm.sockjs.client;

import js.html.Blob;
import js.lib.ArrayBuffer;
import js.lib.ArrayBufferView;

typedef SockJSOption = 
{
	/// String to append to url for actual data connection. Defaults to a random 4 digit number.
	server: String,
	/// Sometimes it is useful to disable some fallback transports. This option allows you to supply a list transports that may be used by SockJS. By default all available transports will be used.
	transports: Array<String>,
	sessionId: String
};

typedef SockJSEvent = Dynamic;

@:jsRequire("sockjs-client")
extern class SockJS 
{
	static public var CONNECTING( default, null ):Int;
	static public var OPEN( default, null ):Int;
	static public var CLOSING( default, null ):Int;
	static public var CLOSED( default, null ):Int;

	/// ready state
	public var readyState( default, null ):Int;
	public var bufferedAmount( default, null ):Int;
	
	
	public function new( url:String, ?_reserved:Dynamic, ?options:SockJSOption );
	
	public var binaryType:String;
	
	public var onopen:SockJSEvent->Void;
	public var onerror:SockJSEvent->Void;
	public var onclose:SockJSEvent->Void;
	public var extensions( default, null ):String;
	public var protocol( default, null ):String;
	public var onmessage:SockJSEvent->Void;
	
	public function close( ?code:Int, ?reason:String ):Void;

	@:overload(function( blob:Blob ):Void{})
	@:overload(function( ab:ArrayBuffer ):Void{})
	@:overload(function( abv:ArrayBufferView ):Void{})
	public function send( s:String ):Void;
}