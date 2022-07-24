package helppy.web.mui.table.virtualized;

import helppy.web.lang.view.LangLabel;
import helppy.web.mui.table.virtualized.VirtualizedTable;
import helppy.web.mui.table.virtualized.data.TableData;
import helppy.web.ui.char.Chars.*;
import helppy.widget.data.field.FieldIds;
import mui.common.Align;
import mui.core.TableSortLabel.SortDirection;
import react.ReactComponent;
import react.ReactMacro.jsx;
import ru.prime.widgetengine.data.field.FieldId;
import ru.prime.widgetengine.data.field.FieldType;
import ru.prime.widgetengine.data.field.FieldValue;
import ru.prime.widgetengine.data.field.Fields;
import ru.prime.widgetengine.data.field.js.Field;
import ru.prime.widgetengine.data.sort.SortData;
import ru.prime.widgetengine.data.sort.SortOrder;
import ru.prime.widgetengine.data.table.RowData;
import ru.prime.widgetengine.data.table.Rows;
using StringTools;

typedef VDsTableData = 
{
	fields: Fields,
	rows: Rows,
	?sortData: SortData,
}

typedef VirtualizedDsTableProps = 
{
	>BaseVirtualizedTableProps,
	data: VDsTableData,
	?keyFieldId: FieldId,
	?colorFieldId: FieldId,
	?getHeaderCellContent: (fieldData: Field) -> Any,
	?getBodyCellContent: (rowData: RowData, rowIndex: Int, fieldData: Field) -> Any,
	?onSortChange: (fieldId: FieldId, sortOrder: SortOrder) -> Void,
}

class VirtualizedDsTable extends ReactComponentOfProps<VirtualizedDsTableProps> 
{
	override function render() 
	{
		final tableData: TableData =
		{
			headers: getHeaders(),
			rows: getRows()
		}
		return jsx('
			<$VirtualizedTable data=${tableData}
				virtualized=${props.virtualized}
				viewMode=${props.viewMode}
				displayedColIds=${props.displayedColIds}
				displayedMessageId=${props.displayedMessageId}
				onSortChange=${onSortChange}
				onRowSelected=${props.onRowSelected}
				onSelectedAll=${props.onSelectedAll}
				selectionDisabled=${props.selectionDisabled}
				headerSelectionHidden=${props.headerSelectionHidden}
				selectedRowIds=${props.selectedRowIds}
				allSelected=${props.allSelected}
				maxCellCharCount=${props.maxCellCharCount}
				onRowClick=${props.onRowClick}
				onRowDoubleClick=${props.onRowDoubleClick}
				onRowDeleteClick=${props.onRowDeleteClick}
				onDeleteAll=${props.onDeleteAll} />
		');
	}

	function getHeaders(): HeaderRowData 
	{
		final res = [];
		if (props.data.fields != null)
		{
			final fields = props.data.fields;
			for (field in fields)
			{
				final fieldData = fields.getFieldData(field.id);
				final cellData = getHeaderCellData(fieldData);
				if (!fieldData.hidden)
					res.push(cellData);
			}
		}
		return res;
	}
	
	inline function getHeaderCellData(field: Field): HeaderCellData 
	{
		final sort = props.data.sortData;
		return 
		{
			id: field.id.toString(),
			content: props.getHeaderCellContent != null ? props.getHeaderCellContent(field) : jsx('<$LangLabel localItemData=${field.name} />'),
			name: field.name.ru,
			align: getAlign(field.typeDesc.type),
			textWrap: props.headerTextWrap,
			customContent: props.getHeaderCellContent != null,
			sortable: field.sortable != null ? field.sortable : false,
			sortDirection: sort != null ? mapOrderToDir(sort.order) : null,
			sortCellId: sort != null ? sort.fieldId.toString(): null
		}
	}

	inline function mapOrderToDir(order: SortOrder): SortDirection
	{
		return switch order
		{
			case SortOrder.ASC: SortDirection.Asc;
			case SortOrder.DESC: SortDirection.Desc;
			default: SortDirection.Asc;
		}	
	}

	inline function mapDirToOrder(dir: SortDirection): SortOrder
	{
		return switch dir
		{
			case SortDirection.Asc: SortOrder.ASC;
			case  SortDirection.Desc: SortOrder.DESC;
			default: SortOrder.ASC;
		}	
	}

	function getRows(): RowsData
	{
		final res = [];
		if (props.data.fields != null && props.data.rows != null)
		{
			final fields = props.data.fields;
			final rows = props.data.rows;
			for (rowIndex in 0 ... rows.length)
			{
				final rowData = rows[rowIndex];
				final keyFieldId = props.keyFieldId != null ? props.keyFieldId : FieldIds.ID;
				final rowId = rowData[keyFieldId].asStr();
				final rowColor = props.colorFieldId != null ? rowData[props.colorFieldId].asStr() : null;
				final vtRowData = 
				{
					rowId: rowId,
					row: [],
					color: rowColor
				};
				for (field in fields)
				{
					final fieldData = fields.getFieldData(field.id);
					final cellData: CellData =
					{
						id: field.id.toString(),
						content: getCellContent(rowData, rowIndex, fieldData),
						name: field.name.ru,
						align: getAlign(fieldData.typeDesc.type),
						width: getBodyColWidth(field.id),
						textWrap: props.bodyTextWrap,
						customContent: props.getBodyCellContent != null
					}
					if (!fieldData.hidden)
						vtRowData.row.push(cellData);
				}
				res.push(vtRowData);
			}
		}
		return res;
	}

	inline function getBodyColWidth(fieldId: FieldId)
	{
		return if (props.bodyColWidth != null)
			props.bodyColWidth;
		else if (props.bodyColWidthMap != null)
			props.bodyColWidthMap[fieldId.toString()];
		else
			null;
	}

	function getCellContent(rowData: RowData, rowIndex: Int, fieldData: Field): Any
	{
		return if (props.getBodyCellContent == null)
		{
			final fieldValue = rowData[fieldData.id];
			final evalFieldValue = fieldValue.evalDisplayValue(fieldData);
			formatFieldValue(evalFieldValue, fieldData);
		}
		else
		{
			props.getBodyCellContent(rowData, rowIndex, fieldData);
		}
	}
	
	function formatFieldValue(value: FieldValue, fieldData: Field): Any
	{
		if (value == null)
			return DASH;
		final type = fieldData.typeDesc.type;
		final format = fieldData.format;
		return switch type
		{
			case BOOL:
			{
				final textId = value.asBool() == true ? "yes" : "no"; 
				jsx('<$LangLabel textId=${textId} />');
			}
			case STRING:
			{
				final strValue = value.asStr().trim();
				strValue != '' ? value.format(type, format) : DASH;
			}
			case LIST:
			{
				value.asList().length  > 0 ? value.stringify(type) : DASH;
			}
			case OBJ:
			{
				value.stringify(type);
			}
			default:
				value.format(type, format);
		}
	}

	inline function getAlign(fieldType: FieldType) 
	{
		return fieldType == FieldType.NUMBER ? Align.Right : Align.Left;	
	}

	function onSortChange(cellId: String, sortDir: SortDirection)
	{
		if (props.onSortChange != null)
		{
			final sortOrder = mapDirToOrder(sortDir);
			props.onSortChange(new FieldId(cellId), sortOrder);
		}
	}
}