package lib.core.lang;

import haxe.DynamicAccess;
import lib.core.event.SignalList;
import lib.core.lang.data.LocaleItem;
import lib.core.lang.data.LocaleItemData;

using StringTools;

typedef TextHandler = (textOrTextId: String, keyExists: Bool) -> String;
typedef LangChangeHandler = (lang: Language) -> Void;

class LangManager 
{
	static var _initialized: Bool = false;
	static var _language: Language = Language.EN;
	static var _localeMap: DynamicAccess<Dynamic>;
	public static var onLangChange(default, null): SignalList<LangChangeHandler>;
	
	public static function init(localMap : DynamicAccess<Dynamic>)
	{
		if (_localeMap == null)
		{
			_localeMap = localMap;
			onLangChange = new SignalList<LangChangeHandler>();
			_initialized = true;
		}
	}
	
	public static function getText(textId: String, textHandler: TextHandler = null, params: Array<Dynamic> = null): String
	{	
		return getTextByLanguage(textId, _language, textHandler, params);
	}

	public static function getTextByLanguage(textId: String, lang: Language, textHandler: TextHandler = null, params: Array<Dynamic> = null): String
	{
		var res: String = "";
		var exists: Bool = false;
		if (_localeMap.exists(textId))
		{
			var values: DynamicAccess<Dynamic> = _localeMap.get(textId);
			if (values.exists(lang))
			{
				exists = true;
				res = values.get(lang);
			}
			else
			{
				res = textId;
			}
		}
		else
		{
			res = textId;
		}
		if (params != null)
		{
			res = replace(res, params);
		}
		if (textHandler != null)
		{
			res = textHandler(res, exists);
		}
		return res;
	}

	public static function getTextByLocaleItem(localeItemData: LocaleItemData, ?language: Language): String
	{
		final currentLanguage = language != null ? language : _language;
		return (localeItemData: LocaleItem).getValueByLang(currentLanguage);
	}

	public static function exists(textId: String): Bool
	{
		return _localeMap.exists(textId);
	}

	public static function replace(text: String, params: Array<Dynamic>): String
	{
		for (i in 0...params.length) 
		{
			text = text.replace('{${i}}', params[i]);
		}
		return text;
	}
	
	public static function changeLanguage(lang: Language)
	{
		_language = lang;
		onLangChange.dispatch(lang);
	}
	
	public static function addValue(key: String, value: Dynamic)
	{
		_localeMap.set(key, value);
	}

	public static function removeValue(key: String) 
	{
		_localeMap.remove(key);	
	}

	public static function addHandler(handler: LangChangeHandler)
	{
		if (_initialized)
		{
			onLangChange.add(handler);
		}
	}

	public static function removeHandler(handler: LangChangeHandler)
	{
		if (_initialized)
		{
			onLangChange.remove(handler);
		}
	}
}