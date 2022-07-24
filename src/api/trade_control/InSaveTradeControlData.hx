package api.trade_control;

import lib.core.data.DateTime;

typedef InSaveTradeControlData = 
{
	isTradeStarted: Bool,
	isAutoOverlap: Bool,
	systemSpread: Float,
	valueDateRecalculationTime: DateTime,
	automaticInitializationTime: DateTime,
	needInitialization: Bool
}