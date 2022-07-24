package js.npm.selenium.webdriver;

import extype.extern.Mixed;

@:jsRequire("selenium-webdriver", "WebDriver")
extern class WebDriver 
{
    function actions(?options: Dynamic): Promise<{}>;
    function findElement(locator:Locator): WebElementPromise;
    function findElements(locator: Locator): Promise<Array<WebElement>>;
    function close(): Promise<{}>;
    function get(url: String): Promise<{}>;
    function getCurrentUrl(): Promise<String>;
    function getTitle(): Promise<String>;
    function navigate(): Navigation;
    function switchTo(): TargetLocator;
    function quit(): Promise<{}>;
    function wait(condition: Mixed2<Promise<{}>, Condition>): WebElementPromise;
}

extern class TargetLocator
{
    function activeElement(): WebElementPromise;
    function alert(): Dynamic;
    function defaultContent(): Promise<{}>;
    function frame(?id: Mixed2<Int, WebElement>): Promise<{}>;
    function window(nameOrHandle: String): Promise<{}>;
}