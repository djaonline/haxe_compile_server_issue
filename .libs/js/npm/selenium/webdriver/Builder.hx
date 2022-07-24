package js.npm.selenium.webdriver;

@:jsRequire("selenium-webdriver", "Builder")
extern class Builder 
{
    public function new(): Void;
    function forBrowser(browser: String): Builder;
    function build(): WebDriver;
}