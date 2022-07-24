package js.npm.ws;

import extype.extern.Mixed;
import js.html.ArrayBuffer;
import js.lib.Error;
import js.node.Buffer;
import js.node.events.EventEmitter;
import haxe.Constraints.Function;

extern class WebSocket extends EventEmitter<WebSocket> 
{
    var OPEN(default, never): Int;
    var CLOSED(default, never): Int;

    var readyState(default, null): Int;

    function new(external: String);

    dynamic function onopen(): Void;
    dynamic function onclose(event: { code: Int, reason: String }): Void; 
    dynamic function onmessage(event: { data: Mixed3<String, Buffer, ArrayBuffer> }): Void;
    dynamic function onping(message: Null<String>): Void;
    dynamic function onpong(message: Null<String>): Void;
    dynamic function onerror(error: { message: String, ?stack: String }): Void;

    function ping(?message: String): Void;
    function send(?message: Mixed3<String, Buffer, ArrayBuffer>, ?options: { ?mask: Bool, ?binary: Bool }, ?callback: Error -> Void, ?compress: Bool): Void;
    function close(?code: Int, ?data: Dynamic): Void;
    function terminate(): Void;
}

enum abstract WebSocketEvent<T: Function>(Event<T>) to Event<T> 
{
    var Open: WebSocketEvent<Void -> Void> = "open";
    var Close: WebSocketEvent<Int -> String -> Void> = "close";
    var Message: WebSocketEvent<Mixed3<String, Buffer, ArrayBuffer> -> Void> = "message";
    var Ping: WebSocketEvent<Null<String> -> Void> = "ping";
    var Pong: WebSocketEvent<Null<String> -> Void> = "pong";
    var Error: WebSocketEvent<String -> Null<String> -> Void> = "error";
}