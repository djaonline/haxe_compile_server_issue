package;

import haxe.DynamicAccess;
import lib.core.lang.Language;
import lib.core.lang.data.LocaleItem;
import lib.core.lang.data.LocaleItemData;

#if macro
import haxe.Json;
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.io.File;
#end

class LocaleMap 
{
	static var _map: DynamicAccess<LocaleItemData>;

	public macro static function getMap(): ExprOf<Dynamic>
	{
		initMap();
		return macro $v{_map};
	}

	public macro static function getText(textId: String, lang: Language = EN): ExprOf<String> 
	{
		initMap();
		final localeItem: LocaleItem = _map.get(textId);
		final str = localeItem != null ? localeItem.getValueByLang(lang) : textId;
		return macro $v{str};
	}
	
#if macro	
	static function getFileContent(): Dynamic
	{
		final target = Context.definedValue("target");
		final path = 'locale/localization.json';
		final resolvedPath = Context.resolvePath(path);
		final str = File.getContent(resolvedPath);
		return Json.parse(str);
	}

	static function initMap() 
	{
		if (_map == null)
		{
			_map = 
			#if !display
				getFileContent();
			#else
				{};
			#end
		}
	}
#end
}