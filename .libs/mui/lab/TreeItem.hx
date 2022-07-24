package mui.lab;

typedef TreeItemClassProps<T> =
{
	?root: T,
	?expanded: T,
	?group: T,
	?content: T,
	?iconContainer: T,
	?label: T
}

typedef TreeItemProps = 
{
	>StandardDOMAttributes,
	var nodeId: String;
	var ?children: ReactFragment;
	var ?classes: TreeItemClassProps<String>;
	var ?collapseIcon: ReactFragment;
	var ?endIcon: ReactFragment;
	var ?expandIcon: ReactFragment;
	var ?icon: ReactFragment;
	var ?label: ReactFragment;
	var ?TransitionComponent: ReactType;
}

@:jsRequire('@material-ui/lab/TreeItem', 'default')
extern class TreeItem extends ReactComponentOfProps<TreeItemProps> 
{
}
