package js.npm.detect_browser;

@:jsRequire("detect-browser")
extern class DetectBrowser 
{
	static function detect(): Info;
}

typedef Info = 
{
	var name: Browser;
  	var version: String;
  	var os: OperatingSystem;
}