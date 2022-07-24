package api.trade_control;

import api.CmdStatus;
import lib.core.lang.data.LocaleItemData;

typedef OutSaveTradeControlData = 
{
	status: CmdStatus,
	?errorMsg: LocaleItemData
}