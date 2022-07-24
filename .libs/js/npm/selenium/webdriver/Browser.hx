package js.npm.selenium.webdriver;

@:jsRequire("selenium-webdriver", "Browser")
extern class Browser 
{
    static var CHROME(default, null): String;
    static var EDGE(default, null): String;
    static var FIREFOX(default, null): String;
    static var IE(default, null): String;
    static var INTERNET_EXPLORER(default, null): String;
    static var SAFARI(default, null): String;
}