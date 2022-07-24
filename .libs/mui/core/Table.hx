package mui.core;

import mui.core.TableCell.TableCellPadding;

enum abstract TableSize(String) 
{
	var Small = "small";
	var Medium = "medium";
}

enum abstract TableSortDirection(Dynamic) 
{
	var Asc = "asc";
	var Desc = "desc";
	var False = false;
}

typedef TableClassProps<T> = 
{
	?root: T,
	?stickyHeader: T
}

typedef TableProps =
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: TableClassProps<String>,
	?component: ReactType,
	?padding: TableCellPadding,
	?size: TableSize,
	?stickyHeader: Bool
};

@:jsRequire('@material-ui/core', 'Table')
extern class Table extends ReactComponentOfProps<TableProps>
{
}

