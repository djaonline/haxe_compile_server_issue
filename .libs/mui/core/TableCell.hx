package mui.core;

import mui.core.Table.TableSize;
import mui.core.Table.TableSortDirection;

enum abstract TableCellPadding(String) 
{
	var Default = "default";
	var Checkbox = "checkbox";
	var None = "none";
}

enum abstract TableCellVariant(String) 
{
	var Head = "head";
	var Body = "body";
	var Footer = "footer";
}

typedef TableCellClassProps<T> = 
{
	?root: T,
	?head: T,
	?body: T,
	?footer: T,
	?sizeSmall: T,
	?paddingCheckbox: T,
	?paddingNone: T,
	?alignLeft: T,
	?alignCenter: T,
	?alignRight: T,
	?alignJustify: T,
	?stickyHeader: T
}

typedef TableCellProps =
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: TableCellClassProps<String>,
	?align: Align,
	?component: ReactType,
	?padding: TableCellPadding,
	?scope: String,
	?size: TableSize,
	?sortDirection: TableSortDirection,
	?variant: TableCellVariant,
	?colSpan: Int,
	?rowSpan: Int
};

@:jsRequire('@material-ui/core', 'TableCell')
extern class TableCell extends ReactComponentOfProps<TableCellProps>
{
}

