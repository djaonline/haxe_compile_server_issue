package mui.core;

typedef TableRowClassProps<T> = 
{
	?root: T,
	?selected: T,
	?hover: T,
	?head: T,
	?footer: T
}

typedef TableRowProps =
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: TableRowClassProps<String>,
	?selected: Bool,
	?hover: Bool,
	?component: ReactType
}

@:jsRequire('@material-ui/core', 'TableRow')
extern class TableRow extends ReactComponentOfProps<TableRowProps>
{
}

