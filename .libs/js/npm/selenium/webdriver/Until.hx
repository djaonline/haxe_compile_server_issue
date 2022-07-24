package js.npm.selenium.webdriver;

@:jsRequire("selenium-webdriver", "until")
extern class Until 
{
   static function elementLocated(locator: By): Condition;
}