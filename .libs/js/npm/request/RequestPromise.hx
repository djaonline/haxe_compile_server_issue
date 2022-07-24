package js.npm.request;

import js.lib.Promise;

@:jsRequire('request-promise')
extern class RequestPromise extends Promise<Dynamic>
{
	@:selfCall
	public function new(?options: Dynamic);
}