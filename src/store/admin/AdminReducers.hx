package store.admin;

import app.form.about_product.action.AboutProductAction;
import app.form.about_product.reducer.AboutProductReducer;
import app.form.about_product.reducer.AboutProductReducer3;
import app.form.about_product.reducer.AboutProductReducer5;
import app.form.about_product.reducer.AboutProductReducer6;
import app.form.about_product.reducer.AboutProductReducer4;
import app.form.about_product.reducer.AboutProductReducer1;
import app.form.about_product.reducer.AboutProductReducer2;
import app.form.about_product.reducer.AboutProductReducer7;
import app.form.trade_control.action.TradeControlAction;
import app.form.trade_control.reducer.TradeControlReducer;
import api.ApiCommand2.Type33;
import api.ApiCommand2.Type32;
import api.ApiCommand2.Type31;
import api.ApiCommand2.Type30;
import api.ApiCommand2.Type29;
import api.ApiCommand2.Type28;
import api.ApiCommand2.Type27;
import api.ApiCommand2.Type26;
import api.ApiCommand2.Type25;
import api.ApiCommand2.Type24;
import api.ApiCommand2.Type23;
import api.ApiCommand2.Type22;
import api.ApiCommand2.Type21;
import api.ApiCommand2.Type20;
import api.ApiCommand2.Type19;
import api.ApiCommand2.Type17;
import api.ApiCommand2.Type16;
import api.ApiCommand2.Type15;
import api.ApiCommand2.Type14;
import api.ApiCommand2.Type13;
import api.ApiCommand2.Type12;
import api.ApiCommand2.Type11;
import api.ApiCommand2.Type10;
import api.ApiCommand2.Type9;
import api.ApiCommand2.Type8;
import api.ApiCommand2.Type7;
import api.ApiCommand2.Type6;
import api.ApiCommand2.Type5;
import api.ApiCommand2.Type4;
import api.ApiCommand2.Type3;
import api.ApiCommand2.Type2;
import api.ApiCommand2.Type1;
import redux.StoreBuilder.*;

class AdminReducers implements IReducerRegistry
{
	var aboutProductReducer: AboutProductReducer;
	
	public function new() 
	{
		aboutProductReducer = new AboutProductReducer(null);
	}

	public function getReducerMap()
	{	
		return
		{
			aboutProductState: mapReducer(AboutProductAction, aboutProductReducer),
		}
	}

	public function getMiddlewaresList() 
	{
		return
		[
			mapMiddleware(AboutProductAction, aboutProductReducer),
		];
	}
}