package app.form.trade_control.reducer;

import lib.core.lang.data.LocaleItemData;

typedef TradeControlState =
{
	>TradeControlData,
	loading: Bool,
	?error: LocaleItemData
}