package lib.ui;

import react.ReactComponent;

enum ModalWinAction 
{
	Show(data: ModalWinData);
	Hide;
}

typedef ModalWinData = 
{
	var ?title: String;
	var ?titleComp: Any;
	var ?titleTextId: String;
	var ?winWidth: String;
	var ?winHeight: String;
	var ?renderAsTicketPanelView: Bool;
	var ?message: String;
	var ?messageTextId: String;
	var ?messageBody: Any;
	var ?messageHeight: Float;
	var ?actionBtn: ReactElement;
	var ?actionBtnStyle: String;
	var ?actionBtnTextId: String;
	var ?body: Any;
	var ?hideCloseBtn: Bool;
	var ?actions: ReactElement;
	var ?onHide: HideHandler;
	var ?onAction: Void -> Void;
}

typedef HideHandler = Void -> Void;