package helppy.web.mui.table.virtualized;

import app.main.theme.ColorPallete;
import js.html.HtmlElement;
import mui.common.Align;
import mui.core.TableCell;
import react.ReactComponent;
import react.ReactMacro.jsx;

typedef BaseCellProps = 
{
	tableContext: TableContext,
	id: String,
	?name: String,
	?style: Dynamic,
	?isHeader: Bool,
	?markingEnabled: Bool,
	?onMarked: String -> Bool -> Void
}

class BaseCell<TProps: BaseCellProps> extends ReactComponentOfProps<TProps>
{
	var _isControl: Bool = false;
	var _container: HtmlElement;

	override function render()
	{
		final className = _isControl ? getControlCellClassName() : null;
		return jsx('	
			<$TableCell	className=${className}
				style=${props.style}
				name=${props.name}
				variant=${getVariant()}
				align=${getAlign()}
				ref=${onGetRef}
				onClick=${onClick}>
				<$Content />
			</$TableCell>
		');
	}

	function onGetRef(el) 
	{
		_container = el;	
	}

	function Content() 
	{
		return null;
	}

	function getVariant(): TableCellVariant 
	{
		return null;	
	}

	function getAlign(): Align
	{
		return null;	
	}

	function getControlCellClassName() 
	{
		final zIndexClass = 
		if (props.isHeader)
			"VirtualizedTable__HeadControlCell-zIndex" 
		else 
			"VirtualizedTable__ControlCell-zIndex";
		return 'VirtualizedTable__ControlCell ${zIndexClass}';
	}

	override function componentDidMount() 
	{
		if (props.markingEnabled)
		{
			props.tableContext.onCellMarkChanged.add(onCellMarkChanged);
			if (isMarked())
				mark(true);
			else
				mark(false);
		}
	}
	
	override function componentWillUnmount() 
	{
		if (props.markingEnabled)
			props.tableContext.onCellMarkChanged.remove(onCellMarkChanged);
	}

	function onCellMarkChanged(cellId: String, marked: Bool) 
	{
		if (props.id == cellId)
		{
			mark(marked);
		}
	 	else if (marked)
		{
			mark(false);
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
			_container.style.backgroundColor = '';
		}
	}	

	inline function isMarked() 
	{
		return props.tableContext.markedCellId == props.id;
	}

	function onClick() 
	{
		if (props.markingEnabled)
		{
			final isMarked = isMarked();
			props.tableContext.changeCellMark(props.id, !isMarked);
			if (props.onMarked != null)
				props.onMarked(props.id, !isMarked);
		}
	}
}