package store;

import redux.Redux.Dispatch;
import redux.StoreMethods;

interface IReducerRegistry 
{
	function getReducerMap(): Dynamic;
	function getMiddlewaresList(): Array<Middleware>;
}

private typedef Middleware = (store: StoreMethods<Dynamic>) ->((next: Dispatch) -> Dynamic);