package js.npm.selenium.webdriver;

extern typedef Navigation = 
{
    function back(): Promise<{}>;
    function forward(): Promise<{}>;
    function refresh(): Promise<{}>;
    function to(url: String): Promise<{}>;
}