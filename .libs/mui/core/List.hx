package mui.core;

typedef ListClassProps<T> =
{
	?root: T,
	?padding: T,
	?dense: T,
	?subheader: T
}

typedef ListProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: ListClassProps<String>,
	?component: ReactType,
	?dense: Bool,
	?disablePadding: Bool,
	?subheader: ReactFragment
};

@:jsRequire('@material-ui/core', 'List')
extern class List extends ReactComponentOfProps<ListProps>
{
}

