package helppy.web.util;

import js.Browser;
import js.Syntax;
import js.html.HtmlElement;
import js.lib.Error;
import js.lib.Promise;

class BrowserUtil 
{
	public static function isIE(version: Int): Bool 
	{
		var userAgent = Browser.navigator.userAgent;
		if (version == 11)
		{
			return userAgent.indexOf("Trident/7.0") > -1;
		}
		return Syntax.code('RegExp("msie" + (!isNaN({0})?("\\\\s"+{0}):""), "i").test({1})', version, userAgent);
	}
	
	public static function getDocumentHeight()
	{
		var doc = Browser.document;
		var scrollHeight = Math.max(doc.body.scrollHeight, doc.documentElement.scrollHeight);
		var offsetHeight = Math.max(doc.body.offsetHeight, doc.documentElement.offsetHeight);
		var clientHeight = Math.max(doc.body.clientHeight, doc.documentElement.clientHeight);
		var max = Math.max(scrollHeight, offsetHeight);
		if (clientHeight > max)
		{
			max = clientHeight;
		}
		return max;
	}

	// finds the offset of el from the body or html element
	public static function getAbsoluteOffsetFromBody(el: HtmlElement)
	{  
   		var x = 0;
   		var y = 0;
    	while( el != null )
    	{
        	x += el.offsetLeft - el.scrollLeft + el.clientLeft;
        	y += el.offsetTop - el.scrollTop + el.clientTop;
        	el = cast el.offsetParent;
    	}
    	return { top: y, left: x };
	}

	// finds the offset of el from relativeEl
	public static function getAbsoluteOffsetFromGivenElement(el: HtmlElement, relativeEl: HtmlElement)
	{  
    	var x = 0;
    	var y = 0;
		while( el != null && el != relativeEl)
		{
			x += el.offsetLeft - el.scrollLeft + el.clientLeft;
			y += el.offsetTop - el.scrollTop + el.clientTop;
			el = cast el.offsetParent;
		}
    	return { top: y, left: x };
	}

	public static function print() 
	{
		if (isIE(11))
		{
			if (Browser.document.queryCommandSupported("print")) 
			{
				Browser.document.execCommand("print", false, null);
			}
		}
		else
		{
			Browser.window.print();
		}	
	}

	public static function loadCss(url: String): Promise<Dynamic>
	{
		return new Promise((resolve, reject) -> {
			final link = Browser.document.createLinkElement();
			link.type = 'text/css';
			link.rel = 'stylesheet';
			link.onload = () -> { resolve(null); };
			link.onerror = () -> { reject(new Error("failed to load css")); };
			link.href = url;
			final headScript = Browser.document.querySelector('script');
    		if (headScript != null)
				headScript.parentNode.insertBefore(link, headScript);
			else
				Browser.document.head.appendChild(link);
		});
	}
}