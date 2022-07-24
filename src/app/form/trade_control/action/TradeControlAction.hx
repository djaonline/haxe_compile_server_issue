package app.form.trade_control.action;

import app.form.trade_control.reducer.TradeControlData;
import lib.core.data.DateTime;
import lib.core.lang.data.LocaleItemData;

enum TradeControlAction
{
	ShowWin;
	SetData(data: TradeControlData);
	ToggleTradeStarted;
	ToggleAutoOverlap;
	SetSpread(spread: Int);
	SetAutoInitTime(time: DateTime);
	SetValueDateRecalculationTime(time: DateTime);
	Initialization;
	ApplySettings;
	Loading(loading: Bool);
	SetError(error: LocaleItemData);
}