package mui.core;

typedef TableBodyClassProps<T> = 
{
	?root: T
}

typedef TableBodyProps =
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: TableBodyClassProps<String>,
	?component: ReactType
}

@:jsRequire('@material-ui/core', 'TableBody')
extern class TableBody extends ReactComponentOfProps<TableBodyProps>
{
}

