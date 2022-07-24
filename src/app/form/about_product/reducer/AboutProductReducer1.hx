package app.form.about_product.reducer;

import app.form.about_product.action.AboutProductAction;
import redux.IMiddleware;
import redux.IReducer;
import redux.StoreMethods;

class AboutProductReducer1 implements IReducer<AboutProductAction, AboutProductState> 
	implements IMiddleware<AboutProductAction, ApplicationState> 
{	

	public var store: StoreMethods<ApplicationState>;

	public var initState: AboutProductState = 
	{
		components: null,
		loading: false
	}

	public function new(helpers: AppHelpers) 
	{
	}

	public function reduce(state: AboutProductState, action: AboutProductAction): AboutProductState 
	{
		switch action
		{
			case AboutProductAction.UpdateComponents(components):
			{
				state.components = components;
			}

			case AboutProductAction.Loading(loading):
			{
				state.loading = loading;
			}
			default:
		}
		return state;
	}

	public function middleware(action: AboutProductAction, next: Void -> Dynamic)
	{	
		switch action
		{
			case AboutProductAction.ShowWin:
			{
			
			}
			default:
		}
		return next();
	}
}
