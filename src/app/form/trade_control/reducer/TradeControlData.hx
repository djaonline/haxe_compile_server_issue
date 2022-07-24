package app.form.trade_control.reducer;

import lib.core.data.DateTime;

typedef TradeControlData =
{
    isTradeStarted: Bool,
	isAutoOverlap: Bool,
	systemSpread: Int,
	valueDateRecalculationTime: DateTime,
	automaticInitializationTime: DateTime,
}