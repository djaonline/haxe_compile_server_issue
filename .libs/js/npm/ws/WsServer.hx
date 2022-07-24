package js.npm.ws;

import extype.extern.Mixed;
import js.html.ArrayBuffer;
import js.node.net.Socket;
import js.node.events.EventEmitter;
import js.node.http.IncomingMessage;
import js.node.http.Server as HttpServer;
import js.node.https.Server as HttpsServer;
import haxe.Constraints.Function;

@:jsRequire("ws", "Server")
extern class WsServer extends EventEmitter<WsServer> {
    var clients(default, null): Set;
    function new(options: WsServerOptions);
    function handleUpgrade(request: IncomingMessage, socket: Socket, upgradeHead: ArrayBuffer, ?callback: WebSocket -> Void): Void;
    function broadcast(message: Dynamic, ?options: { ?binary: Bool }): Void;
    function startAutoPing(interval: Int, ?userMessage: String): Void;
    function close(?callback: Void -> Void): Void;
}

typedef WsServerOptions = {
    @:optional var host: String;
    @:optional var port: Int;
    @:optional var path: String;
    @:optional var perMessageDeflate: Bool;
    @:optional var noServer: Bool;
    @:optional var server: Mixed2<HttpServer, HttpsServer>;
    @:optional var verifyClient: Mixed2<VerifyClientCallback, VerifyClientCallbackAsync>;
}

typedef VerifyClientCallback = VerificationInfo -> Bool;
typedef VerifyClientCallbackAsync = VerificationInfo -> (Bool -> Void) -> Void;
typedef VerificationInfo = {
    var origin(default, null): String;
    var secure(default, null): Bool;
    var req(default, null): IncomingMessage;
}

@:enum abstract ServerEvent<T: Function>(Event<T>) to Event<T> {
    var Listening: ServerEvent<Void -> Void> = "listening";
    var Connection: ServerEvent<WebSocket -> Void> = "connection";
    var Error: ServerEvent<Error -> Void> = "error";
}

typedef Set = Dynamic; 