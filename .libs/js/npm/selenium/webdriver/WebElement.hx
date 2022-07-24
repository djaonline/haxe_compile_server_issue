package js.npm.selenium.webdriver;

import haxe.extern.EitherType;
import haxe.extern.Rest;

extern class WebElement
{
    function clear(): Promise<{}>;
    function click(): Promise<{}>;
    function findElement(locator:Locator): WebElementPromise;
    function findElements(locator: Locator): Promise<Array<WebElement>>;
    function getAttribute(attributeName: String): Promise<String>;
    function getCssValue(cssStyleProperty: String): Promise<String>;
    function getDriver(): WebDriver;
    function getId(): Promise<String>;
    function getRect(): Promise<{height: Float, width: Float, x: Float, y: Float}>;
    function getTagName(): Promise<String>;
    function getText(): Promise<String>;
    function isDisplayed(): Promise<Bool>;
    function isEnabled(): Promise<Bool>;
    function isSelected(): Promise<Bool>;
    function sendKeys(keys: Rest<String>): Promise<{}>;
    function submit(): Promise<{}>;
    function takeScreenshot(?scroll: Bool): Promise<String>;
    static function equals(a: WebElement, b: WebElement): Promise<Bool>;
    static function buildId(id: String, ?noLegacy: Bool): Dynamic;
    static function isId(obj: Dynamic): Bool;
}