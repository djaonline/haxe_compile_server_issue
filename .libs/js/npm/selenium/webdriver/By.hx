package js.npm.selenium.webdriver;

@:jsRequire("selenium-webdriver", "By")
extern class By
{
    static function className(name: String): By;
    static function css(selector: String): By;
    static function id(id: String): By;
    static function linkText(text: String): By;
    static function name(name: String): By;
    static function xpath(xpath: String): By;
}