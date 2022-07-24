package js.npm.selenium.webdriver;

import extype.extern.Mixed;

extern interface Promise<T> 
{
    function then(resolve: ResolveFunc<T>, ?reject: Dynamic -> Void): Promise<T>;
    function when<A>(map: T -> A): Promise<A>;
}

typedef ResolveFunc<T> = Mixed2<T,Void> -> Void;