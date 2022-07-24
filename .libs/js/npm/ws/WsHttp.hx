package js.npm.ws;

import js.node.http.IncomingMessage;
import js.node.http.ServerResponse;

@:jsRequire("ws", "http")
extern class WsHttp {
    static function createServer(?app: IncomingMessage -> ServerResponse -> Void): WsHttp;
    static function getExpressApp(express: Dynamic): Dynamic;
    static function getResponsePrototype(): ServerResponse;
    static function getRequestPrototype(): IncomingMessage;

    function listen(port: Int): Void;
}
