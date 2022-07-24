package app.form.trade_control.view;

import app.form.trade_control.action.TradeControlAction;
import lib.core.data.DateTime;
import lib.core.lang.LangManager;
import lib.core.lang.Language;


import helppy.web.mui.picker.KeyboardTimePicker;
import helppy.web.mui.switcher.Switcher;
import js.lib.Date as JsDate;


using LocaleMap;

typedef ControlFormState = 
{
	isTradeStarted: Bool,
	isAutoOverlap: Bool,
	systemSpread: Int,
	valueDateRecalculationTime: DateTime,
	automaticInitializationTime: DateTime,
	loading: Bool
}

typedef TimeRendererProps =
{
	value: DateTime,
	labelTextId: String,
	onChange: JsDate -> Void
}

@:jsxStatic('render')
class TradeControlForm 
{
	public static function render(props: TimeRendererProps)
	{
		return null;
	}
}