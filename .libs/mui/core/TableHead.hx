package mui.core;

typedef TableHeadClassProps<T> = 
{
	?root: T
}

typedef TableHeadProps =
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: TableHeadClassProps<String>,
}

@:jsRequire('@material-ui/core', 'TableHead')
extern class TableHead extends ReactComponentOfProps<TableHeadProps>
{
}

