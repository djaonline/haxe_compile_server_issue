package app.form.trade_control.reducer;

import api.ApiCommand;
import api.CmdStatus;
import api.trade_control.InSaveTradeControlData;
import api.trade_control.OutSaveTradeControlData;
import app.form.trade_control.action.TradeControlAction;
import app.form.trade_control.view.TradeControlForm;
import app.form.trade_control.view.TradeControlFormActions;
import haxe.DynamicAccess;
import lib.ds.DatasetId;
import lib.ds.FieldId;
import lib.net.ICmdClient;
import lib.ui.ModalWinAction;
import redux.IMiddleware;
import redux.IReducer;
import redux.StoreMethods;

class TradeControlReducer implements IReducer<TradeControlAction, TradeControlState> 
	implements IMiddleware<TradeControlAction, ApplicationState> 
{	
	var _cmdClient: ICmdClient;

	public var store: StoreMethods<ApplicationState>;

	public var initState: TradeControlState =
	{
		isTradeStarted: false,
		isAutoOverlap: false,
		systemSpread: 0,
		valueDateRecalculationTime: null,
		automaticInitializationTime: null,
		loading: false
	};

	public function new()
	{
	}

	public function reduce(state: TradeControlState, action: TradeControlAction): TradeControlState
	{
		switch action
		{
			case TradeControlAction.SetData(data):
			{
				state.isTradeStarted = data.isTradeStarted;
				state.isAutoOverlap = data.isAutoOverlap;
				state.systemSpread = data.systemSpread;
				state.valueDateRecalculationTime = data.valueDateRecalculationTime;
				state.automaticInitializationTime = data.automaticInitializationTime;
			}

			case TradeControlAction.ToggleTradeStarted:
			{
				state.isTradeStarted = !state.isTradeStarted;
			}

			case TradeControlAction.ToggleAutoOverlap:
			{
				state.isAutoOverlap = !state.isAutoOverlap;
			}

			case TradeControlAction.SetSpread(spread):
			{
				state.systemSpread = spread;
			}

			case TradeControlAction.SetValueDateRecalculationTime(time):
			{
				state.valueDateRecalculationTime = time;
			}

			case TradeControlAction.SetAutoInitTime(time):
			{
				state.automaticInitializationTime = time;
			}

			case TradeControlAction.Loading(loading):
			{
				state.loading = loading;
			}

			case TradeControlAction.SetError(error):
			{
				state.error = error;
			}
			default:
		}
		return state;
	}

	public function middleware(action: TradeControlAction, next: Void -> Dynamic)
	{	
		switch action
		{
			case TradeControlAction.ShowWin:
			{
				store.dispatch(TradeControlAction.Loading(true));

				_cmdClient.send(ApiCommand.GetDataset, { id: new DatasetId("Control") }).then(
					(outData) ->
					{
						final data: DynamicAccess<Dynamic> = outData.data[0];

						store.dispatch(TradeControlAction.SetData(
							{
								isTradeStarted: data[new FieldId("isTradeStarted")].asStr() == "1" ? true : false,
								isAutoOverlap: data[new FieldId("isAutoOverlap")].asStr() == "1" ? true : false,
								systemSpread: data[new FieldId("systemSpread")].asInt(),
								valueDateRecalculationTime: data[new FieldId("valueDateReculculationTime")].asAny(),
								automaticInitializationTime: data[new FieldId("automaticInitializationTime")].asAny()
							}
						));
						
						store.dispatch(TradeControlAction.Loading(false));
					}
				);
				
				final modalData: ModalWinData =
				{
					titleTextId: "control",
					winWidth: "450px",
					winHeight: "270px",
					body: jsx('<$TradeControlForm />'),
					actions: jsx('<$TradeControlFormActions />')
				}
				
				store.dispatch(ModalWinAction.Show(modalData));
			}
			
			case TradeControlAction.Initialization:
			{
				sendSaveTradeControl(true);
			}

			case TradeControlAction.ApplySettings:
			{
				sendSaveTradeControl(false);
			}

			default:
		}
		return next();
	}

	function sendSaveTradeControl(needInitialization: Bool)
	{
		final tradeControl = store.getState().tradeControlState;
		final valueDateRecalculationTime: Dynamic = tradeControl.valueDateRecalculationTime;
		final automaticInitializationTime: Dynamic = tradeControl.automaticInitializationTime;
		final inData: InSaveTradeControlData =
		{
			isTradeStarted: tradeControl.isTradeStarted,
			isAutoOverlap: tradeControl.isAutoOverlap,
			systemSpread: tradeControl.systemSpread,
			valueDateRecalculationTime: valueDateRecalculationTime.isValid() ? valueDateRecalculationTime : null,
			automaticInitializationTime: automaticInitializationTime.isValid() ? automaticInitializationTime : null,
			needInitialization: needInitialization
		};
		_cmdClient.send(ApiCommand.SaveTradeControl, inData).then(
			(outData: OutSaveTradeControlData) ->
			{
				if (outData.status == CmdStatus.OK)
				{
					store.dispatch(ModalWinAction.Hide);
					store.dispatch(TradeControlAction.SetError(null));
				}
				else
				{
					store.dispatch(TradeControlAction.SetError(outData.errorMsg));
				}
			}
		);
	}
}
