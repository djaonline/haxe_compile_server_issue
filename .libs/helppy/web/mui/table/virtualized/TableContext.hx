package helppy.web.mui.table.virtualized;

import helppy.core.event.SignalList;

class TableContext
{
	public var markedRowId(default, null): String;
	public var markedCellId(default, null): String;

	public var onRowMarkChanged(default, null): SignalList<String -> Bool -> Void>;
	public var onCellMarkChanged(default, null): SignalList<String -> Bool -> Void>;
	
	public function new() 
	{
		onRowMarkChanged = new SignalList();
		onCellMarkChanged = new SignalList();
	}
	
	public function changeRowMark(rowId: String, marked: Bool) 
	{
		this.markedRowId = marked ? rowId : null;
		onRowMarkChanged.dispatch(rowId, marked);	
	}
	
	public function changeCellMark(cellId: String, marked: Bool) 
	{
		this.markedCellId = marked ? cellId : null;
		onCellMarkChanged.dispatch(cellId, marked);
	}

	public function resetMarkedCellId() 
	{
		changeCellMark(markedCellId, false);
		markedCellId = null;
	}
}