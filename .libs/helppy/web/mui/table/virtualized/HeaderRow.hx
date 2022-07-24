package helppy.web.mui.table.virtualized;

import helppy.web.mui.table.virtualized.data.BaseRowProps;
import helppy.web.mui.table.virtualized.data.TableData.HeaderRowData;
import mui.core.TableRow;
import mui.core.TableSortLabel.SortDirection;
import react.PureComponent;
import react.ReactMacro.jsx;

typedef HeaderRowProps = 
{
	>BaseRowProps,
	data: HeaderRowData,
	tableContext: TableContext,
	?displayedCellIds: Array<String>,
	?maxCellCharCount: Int,
	?onSortChange: (cellId: String, sortDirection: SortDirection) -> Void,
	?onSelected: Bool -> Void,
	?onDeleteAll: Void -> Void
}

class HeaderRow extends PureComponentOfProps<HeaderRowProps>
{
	override function render() 
	{
		return if (props.data != null)
		{
			jsx('
				<$TableRow name="Заголовки таблицы">
					${getCells()}
				</$TableRow>
			');
		}
		else
			null;
	}

	function getCells() 
	{
		final cells = [];
		if (props.data.length > 0)
		{
			var firstCell = null;
			var lastCell = null;
			switch props.viewMode
			{
				case TableViewMode.SELECTABLE:
				{
					firstCell = jsx('
						<$CheckboxCell key="__checkbox__"
							tableContext=${props.tableContext}
							checked=${props.selected}
							disabled=${props.selectionDisabled}
							isHeader=${true}
							hiddenCheckbox=${props.headerSelectionHidden}
							onChecked=${props.onSelected} />
					');
				}
				case TableViewMode.DELETEABLE:
				{
					lastCell = jsx('
						<$DeleteCell key="__delete__"
							tableContext=${props.tableContext}
							isHeader=${true}
							onClick=${props.onDeleteAll} />
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
			for (headerData in props.data)
			{
				if (displayedCellIds == null || displayedCellIds.indexOf(headerData.id) > -1)
				{
					final cell = jsx('
						<$HeaderCell key=${headerData.id}
							tableContext=${props.tableContext}
							{...headerData}
							maxCellCount=${props.maxCellCharCount}
							onSortChange=${props.onSortChange}/>
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
}