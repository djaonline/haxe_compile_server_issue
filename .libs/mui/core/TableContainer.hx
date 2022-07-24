package mui.core;

typedef TableContainerClassProps<T> = 
{
	?root: T
}

typedef TableContainerProps =
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: TableContainerClassProps<String>,
	?component: ReactType
}

@:jsRequire('@material-ui/core', 'TableContainer')
extern class TableContainer extends ReactComponentOfProps<TableContainerProps>
{
}

