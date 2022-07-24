package helppy.web.mui.table.virtualized.data;

import mui.common.Align;
import mui.core.TableSortLabel.SortDirection;

typedef CellData = 
{
	id: String,
	content: Any,
	?name: String,
	?align: Align,
	?width: String,
	?textWrap: Bool,
	?customContent: Bool,
	?markingEnabled: Bool,
	?onMarked: String -> Bool -> Void
}

typedef HeaderCellData = 
{
	>CellData,
	?sortable: Bool,
	?sortCellId: String,
	?sortDirection: SortDirection
}

typedef HeaderRowData = Array<HeaderCellData>;

typedef RowData = 
{
	rowId: String,
	row: Array<CellData>,
	?color: String,
	?height: Float
}

typedef RowsData = Array<RowData>;

typedef TableData = 
{
	headers: HeaderRowData,
	rows: RowsData
}