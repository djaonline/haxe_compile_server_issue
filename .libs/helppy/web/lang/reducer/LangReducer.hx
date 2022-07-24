package helppy.web.lang.reducer;

import lib.core.lang.LangManager;
import lib.core.lang.Language;
import helppy.web.lang.action.LangAction;
import helppy.web.lang.LangApplicationState;
import redux.IMiddleware;
import redux.IReducer;
import redux.StoreMethods;
import react.ReactUtil.copy;

class LangReducer implements IReducer<LangAction, LanguageState> 
	implements IMiddleware<LangAction, LangApplicationState>
{
	public var store: StoreMethods<LangApplicationState>;
	public var initState: LanguageState = { lang: Language.RU };
	
	public function new() 
	{
	}
	
	public function reduce(state: LanguageState, action: LangAction): LanguageState 
	{
		return switch(action)
		{
			case LangAction.ChangeLanguage(lang):
				copy(state, {lang: lang});
		}
	}
	
	public function middleware(action: LangAction, next: Void -> Dynamic)
	{
		return switch(action)
		{
			case LangAction.ChangeLanguage(lang):
			{	
				LangManager.changeLanguage(lang);
				next();
			}
			default: next();
		}
	}
}