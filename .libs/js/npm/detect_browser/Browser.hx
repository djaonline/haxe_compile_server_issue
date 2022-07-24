package js.npm.detect_browser;

enum abstract Browser(String) from String to String
{
	var Edge = 'edge';
  	var YandexBrowser = 'yandexbrowser';
	var Chrome = 'chrome';
  	var Firefox = 'firefox';
	var Opera = 'opera';
  	var IE = 'ie';
	var Safari = 'safari';
}