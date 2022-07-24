package api;

import lib.api.Command;
import api.trade_control.InSaveTradeControlData;
import api.trade_control.OutSaveTradeControlData;

enum abstract ApiCommand<TInData, TOutData>(Command<TInData, TOutData>) to Command<TInData, TOutData>
{
	var GetDataset: ApiCommand<Dynamic, Dynamic> = "getDataset";
	var SaveTradeControl: ApiCommand<InSaveTradeControlData, OutSaveTradeControlData> = "saveTradeControl";
}