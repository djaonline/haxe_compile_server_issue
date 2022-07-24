package js.npm.ws;

@:jsRequire("ws")
extern class Ws extends WebSocket {
    static var OPEN(default, never): Int;
    static var CLOSED(default, never): Int;

    function new(uri: String);
}
