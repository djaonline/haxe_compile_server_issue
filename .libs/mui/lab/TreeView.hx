package mui.lab;

import haxe.extern.EitherType;

typedef TreeViewClassProps<T> =
{
	?root: T
}

typedef TreeViewProps = 
{
	>StandardDOMAttributes,
	var ?children: ReactFragment;
	var ?classes: TreeViewClassProps<String>;
	var ?defaultCollapseIcon: ReactFragment;
	var ?defaultEndIcon: ReactFragment;
	var ?defaultExpanded: Array<String>;
	var ?defaultExpandIcon: ReactFragment;
	var ?defaultParentIcon: ReactFragment;
	var ?expanded: Array<String>;
	var ?onNodeToggle: HandlerOrVoid<Event->Array<String>->Void>;
	var ?onNodeSelect: HandlerOrVoid<Event->EitherType<String, Array<String>> -> Void>;
}

@:jsRequire('@material-ui/lab/TreeView', 'default')
extern class TreeView extends ReactComponentOfProps<TreeViewProps> 
{
}