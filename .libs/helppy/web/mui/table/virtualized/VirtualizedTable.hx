package helppy.web.mui.table.virtualized;

import css.Overflow.OverflowCompo;
import css.Position;
import css.TextAlign;
import helppy.web.lang.view.LangLabel;
import helppy.web.mui.table.virtualized.data.BaseTableProps;
import helppy.web.mui.table.virtualized.data.TableData;
import js.html.HtmlElement;
import mui.core.Table;
import mui.core.TableBody;
import mui.core.TableHead;
import mui.core.TableSortLabel.SortDirection;
import mui.core.Typography;
import mui.core.styles.Styles.makeStyles;
import react.ReactComponent;
import react.ReactMacro.jsx;

using helppy.web.mui.table.virtualized.VirtualizedTable.VirtualizedTableUtils;

typedef BaseVirtualizedTableProps = 
{
	>BaseTableProps,
	?allSelected: Bool,
	?selectedRowIds: Array<String>,
	?maxCellCharCount: Int,
	?virtualized: Bool,
}

typedef VirtualizedTableProps = 
{
	>BaseVirtualizedTableProps,
	data: TableData,
	?size: TableSize,
	?rowMarkingDisabled: Bool,
	?rowHoverDisabled: Bool,
	?onSortChange: (cellId: String, sortDirection: SortDirection) -> Void,
}

typedef VirtualizedTableState = 
{
	rows: RowsData,
	scrollTop: Float,
	viewportHeight: Float
}

class VirtualizedTable 
	extends ReactComponentOfPropsAndState<VirtualizedTableProps, VirtualizedTableState> 
{
	public static final useStyle = makeStyles(
	{
		container:
		{
			width: "100%",
			height: "100%",
			overflow: OverflowCompo.Auto
		},
		message:
		{
			position: Position.Absolute,
			top: "50%",
			left: "50%",
			transform: "translate(-50%, -50%)",
			textAlign: TextAlign.Center
		}
	});

	public static function getDerivedStateFromProps(nextProps: VirtualizedTableProps, 
		state: VirtualizedTableState): VirtualizedTableState
	{
		return if (nextProps.virtualized)
		{
			if (nextProps.data.rows.length != 0)
			{
				{ 
					rows: nextProps.data.rows.getRenderedRows(state.scrollTop, state.viewportHeight),
					scrollTop: state.scrollTop,
					viewportHeight: state.viewportHeight
				};
			}
		else
			null;
		}
		else 
			null;
	}

	var _context: TableContext;
	var _container: HtmlElement;

	public function new(props) 
	{
		super(props);	
		_context = new TableContext();
		state = { rows: [], scrollTop: 0, viewportHeight: 0 };
	}

	public function resetMarkedCellId() 
	{
		if (_context != null)
			_context.resetMarkedCellId();
	}
	
	override function render() 
	{
		return jsx('<$TableImpl />');
	}

	function TableImpl() 
	{
		final classes = useStyle();
		return jsx('
			<div className=${classes.container}
				onScroll=${onContainerScroll}
				ref=${onGetContainerRef}>
				<$Table stickyHeader=${true}
					size=${props.size}>
					<$TableHead>
						<$HeaderRow data=${props.data.headers}
							tableContext=${_context}
							viewMode=${props.viewMode}
							displayedCellIds=${props.displayedColIds}
							onSortChange=${props.onSortChange}
							onSelected=${props.onSelectedAll}
							onDeleteAll=${props.onDeleteAll}
							selected=${props.allSelected} 
							selectionDisabled=${props.selectionDisabled}
							headerSelectionHidden=${props.headerSelectionHidden}
							maxCellCharCount=${props.maxCellCharCount} />
					</$TableHead>
					<$Body />
				</$Table>
				<$Message />
			</div>
		');
	}

	function Body()
	{
		return if (props.displayedMessageId == null)
			jsx('
				<$TableBody name="Тело таблицы">
					${getRows()}
				</$TableBody>
			');
		else
			null;
	}

	function Message()
	{
		return if (props.displayedMessageId != null)
		{
			final classes = useStyle();
			jsx('
				<div className=${classes.message}
					name="Сообщение">
					<$Typography variant=${TypographyVariant.Body1}>
						<$LangLabel textId=${props.displayedMessageId} />
					</$Typography>	
				</div>
			');
		}
		else
			null;
	}

	function onGetContainerRef(container: HtmlElement)
	{
		_container = container;
	}
	
	override function componentDidMount() 
	{
		if (props.virtualized)
		{
			// we need using timer here, otherwise container has a zero height
			haxe.Timer.delay(() -> { 
				doSetState();
			}, 0);
		}
	}

	inline function doSetState() 
	{
		final scrollTop = _container.scrollTop;
		final viewportHeight = _container.clientHeight - VirtualizedTableUtils.HEADER_ROW_HEIGHT;
		final newState: VirtualizedTableState = 
		{
			rows: props.data.rows.getRenderedRows(scrollTop, viewportHeight),
			scrollTop: scrollTop,
			viewportHeight: viewportHeight
		};
		setState(newState);
	}

	function getRows() 
	{
		final bodyRows = [];
		final rows = props.virtualized ? state.rows : props.data.rows;
		for(i in 0 ... rows.length)	
		{
			final rowData = rows[i];
			final rowId = rowData.rowId;
			var selected = false;
			if (props.viewMode == TableViewMode.SELECTABLE)
			{
				selected = (props.selectedRowIds != null) && 
				(props.selectedRowIds.indexOf(rowId) > -1 || props.allSelected);
			}
			final bodyRow = jsx('
				<$BodyRow key=${rowId}
					data=${rowData}
					viewMode=${props.viewMode}
					displayedCellIds=${props.displayedColIds}
					tableContext=${_context}
					onSelected=${props.onRowSelected}
					selected=${selected}
					selectionDisabled=${props.selectionDisabled}
					maxCellCharCount=${props.maxCellCharCount}
					onClick=${onRowClick} 
					onDoubleClick=${onRowDoubleClick}
					onDeleteClick=${props.onRowDeleteClick}
					markingDisabled=${props.rowMarkingDisabled}
					hoverDisabled=${props.rowHoverDisabled} />
			');
			bodyRows.push(bodyRow);
		}
		return bodyRows;
	}

	function onContainerScroll(_)
	{
		if (props.virtualized)
			doSetState();
	}

	function onRowClick(rowId: String) 
	{
		if (props.onRowClick != null)
			props.onRowClick(rowId);
	}

	function onRowDoubleClick(rowId: String) 
	{
		if (props.onRowDoubleClick != null)
			props.onRowDoubleClick(rowId);
	}
}

class VirtualizedTableUtils 
{
	public static final ROW_HEIGHT = 29;
	public static final HEADER_ROW_HEIGHT = 38;
	public static final INVERSE_ROW_HEIGHT =  1 / ROW_HEIGHT;

	public static function getRenderedRows(rows: RowsData, scrollTop: Float, viewportHeight: Float): RowsData 
	{
		if (rows.length == 0 || viewportHeight == 0)
			return [];
		final scrolledItemCount = Math.floor(scrollTop * INVERSE_ROW_HEIGHT);
		final renderedItemCount = Math.floor(viewportHeight * INVERSE_ROW_HEIGHT) + 1; 
		var firstRowHeight: Float = null;
		var startIndex = 0;
		if (scrolledItemCount > 0)
		{
			startIndex = scrolledItemCount - 1;
			firstRowHeight = scrolledItemCount * ROW_HEIGHT;
		}
		final lastItemIndex = rows.length - 1;
		var lastRowHeight: Float = null;
		var endIndex = startIndex + renderedItemCount + 1;
		if (endIndex < lastItemIndex)
		{
			lastRowHeight = (lastItemIndex - endIndex + 1) * ROW_HEIGHT;
		}
		else
			endIndex = lastItemIndex;
		final result = rows.slice(startIndex, endIndex + 1);
		for (i in 0 ... result.length)
		{
			if (i == 0)
				result[i].height = firstRowHeight;
			else if (i == result.length - 1)
				result[i].height = lastRowHeight;
			else 
				result[i].height = null;
		}
		return result;
	}
}
