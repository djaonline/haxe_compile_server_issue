package js.npm.redux_dynamic_middlewares;

import redux.Redux.Dispatch;
import redux.StoreMethods;

@:jsRequire('redux-dynamic-middlewares', 'default')
extern class Enhancer 
{
}

@:jsRequire('redux-dynamic-middlewares')
extern class Middlewares
{
	static function addMiddleware(m: Middleware): Void;
}

private typedef Middleware = (store: StoreMethods<Dynamic>) -> ((next: Dispatch) -> Dynamic);