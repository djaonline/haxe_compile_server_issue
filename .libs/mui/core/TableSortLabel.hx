package mui.core;

enum abstract SortDirection(String) 
{
	var Asc = "asc";
	var Desc = "desc";
}

typedef TableSortLabelClassProps<T> = 
{
	?root: T,
	?active: T,
	?icon: T,
	?iconDirectionDesc: T,
	?iconDirectionAsc: T
}

typedef TableSortLabelProps =
{
	>StandardDOMAttributes,
	?active: Bool,
	?children: ReactFragment,
	?classes: TableSortLabelClassProps<String>,
	?direction: SortDirection,
	?hideSortIcon: Bool,
	?IconComponent: ReactType,
}

@:jsRequire('@material-ui/core', 'TableSortLabel')
extern class TableSortLabel extends ReactComponentOfProps<TableSortLabelProps>
{
}

