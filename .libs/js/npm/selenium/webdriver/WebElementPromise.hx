package js.npm.selenium.webdriver;

import haxe.extern.EitherType;

extern class WebElementPromise extends WebElement implements Promise<WebElementPromise>
{
    function then(resolve: EitherType<WebElementPromise, Void> -> Void, ?reject: Dynamic -> Void): Promise<WebElementPromise>;
    function when<A>(map: WebElementPromise -> A): Promise<A>;
}