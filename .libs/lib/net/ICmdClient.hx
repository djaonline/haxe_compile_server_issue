package lib.net;

import lib.api.Command;
import js.lib.Error;
import js.lib.Promise;

interface ICmdClient 
{
	var connectionStatus(get, null): String;
	var onBeforeSend(null, default): Dynamic -> Promise<Dynamic>;
	var onDisconnected(null, default): Void -> Void;
	var onError(null, default): Error -> Void;
	var onCmdError(null, default): Command<Dynamic, Dynamic> -> Error -> Void;
	function connect(?onConnected: Void -> Void): Void;
	function send<TInData, TOutData>(command: Command<TInData, TOutData>, data: TInData = null): Promise<TOutData>;
	function on<TInData, TOutData>(command: Command<TInData, TOutData>, onData: TOutData -> Void): Void;
	function hasSubscribers<TInData, TOutData>(command: Command<TInData, TOutData>): Bool;
}