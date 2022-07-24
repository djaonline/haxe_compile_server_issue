package helppy.web.mui.table.virtualized.data;

typedef BaseTableProps = 
{
	?viewMode: TableViewMode,
	?displayedColIds: Array<String>,
	?displayedMessageId: String,
	?selectionDisabled: Bool,
	?performActionDisabled: Bool,
	?headerSelectionHidden: Bool,
	?headerTextWrap: Bool,
	?bodyTextWrap: Bool,
	?bodyColWidth: String,
	?bodyColWidthMap: Map<String, String>,
	?onRowSelected: (rowId: String, selected: Bool) -> Void,
	?onRowClick: (rowId: String) -> Void,
	?onRowDoubleClick: (rowId: String) -> Void,
	?onRowDeleteClick: (rowId: String) -> Void,
	?onSelectedAll: Bool -> Void,
	?onDeleteAll: Void -> Void
}