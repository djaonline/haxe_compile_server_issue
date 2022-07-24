package helppy.web.mui.table.virtualized;

import app.main.theme.ColorPallete;
import helppy.web.mui.table.virtualized.data.BaseRowProps;
import helppy.web.mui.table.virtualized.data.TableData.RowData;
import js.html.HtmlElement;
import mui.core.TableRow as MUITableRow;
import react.ReactComponent;
import react.ReactMacro.jsx;

typedef BodyRowProps = 
{
	>BaseRowProps,
	data: RowData,
	tableContext: TableContext,
	?displayedCellIds: Array<String>,
	?height: Float,
	?maxCellCharCount: Int,
	?markingDisabled: Bool,
	?hoverDisabled: Bool,
	?onSelected: (rowId: String, selected: Bool) -> Void,
	?onDoubleClick: (rowId: String) -> Void,
	?onDeleteClick: (rowId: String) -> Void
}

class BodyRow extends ReactComponentOfProps<BodyRowProps>
{
	var _container: HtmlElement;

	override function render()
	{
		final cells = getCells(props.data);
		final hover = props.hoverDisabled ? false : true;
		return jsx('
			<$MUITableRow key=${props.data.rowId}
				name="Ряд"
				ref=${onGetRef}
				style=${{ height: props.data.height, backgroundColor: props.data.color }}
				onClick=${onClick}
				onDoubleClick=${props.onDoubleClick.bind(props.data.rowId)}
				hover=${hover}
				selected=${props.selected}>
				${cells}
			</$MUITableRow>
		');
	}

	function onGetRef(el) 
	{
		_container = el;	
	}

	function getCells(rowData: RowData) 
	{
		final cells = [];
		if (rowData.row.length > 0)
		{
			var firstCell = null;
			var lastCell = null;
			switch props.viewMode
			{
				case TableViewMode.SELECTABLE:
				{
					final key = '${rowData.rowId}-__checkbox__';
					firstCell = jsx('
						<$CheckboxCell key=${key}
							id=${key}
							name="Чекбокс"
							tableContext=${props.tableContext}
							checked=${props.selected}
							disabled=${props.selectionDisabled}
							onChecked=${props.onSelected.bind(rowData.rowId)} />
					');
				}
				case TableViewMode.DELETEABLE:
				{
					final key = '${rowData.rowId}-__delete__';
					lastCell = jsx('
						<$DeleteCell key=${key}
							tableContext=${props.tableContext}
							id=${key}
							onClick=${props.onDeleteClick.bind(rowData.rowId)} />
					');
				}
				case TableViewMode.DEFAULT:
				{
				}
			}
			if (firstCell != null)
			{
				cells.push(firstCell);
			}
			final displayedCellIds = props.displayedCellIds;
			for (cellData in rowData.row)
			{
				if (displayedCellIds == null || displayedCellIds.indexOf(cellData.id) > -1)
				{
					final key = '${rowData.rowId}-${cellData.id}';
					final cell = jsx('
						<$BodyCell key=${key}
							name=${cellData.name}
							maxCharCount=${props.maxCellCharCount}
							tableContext=${props.tableContext}
							{...cellData} />
					');
					cells.push(cell);
				}
			}
			if (lastCell != null)
			{
				cells.push(lastCell);
			}
		}
		return cells;
	}

	override function componentDidMount() 
	{
		if (!props.markingDisabled)
		{
			props.tableContext.onRowMarkChanged.add(onRowMarkChanged);
			if (isMarked())
				mark(true);
		}
	}

	override function componentWillUnmount() 
	{
		if (!props.markingDisabled)
			props.tableContext.onRowMarkChanged.remove(onRowMarkChanged);
	}

	function onRowMarkChanged(rowId: String, marked: Bool) 
	{
		if (props.data.rowId == rowId)
		{
			mark(marked);
		}
		else if (marked)
		{
			mark(false);
		}
	}

	function onClick() 
	{
		if (!props.markingDisabled)
		{
			props.tableContext.changeRowMark(props.data.rowId, !isMarked());
		}
	}

	inline function mark(marked: Bool)
	{
		if (marked)
		{
			_container.style.backgroundColor = ${ColorPallete.GREY_100};
		}
		else
		{
			final color = props.data.color != null ? props.data.color : '';
			_container.style.backgroundColor = color;
		}
	}	

	inline function isMarked() 
	{
		return props.tableContext.markedRowId == props.data.rowId;
	}
}