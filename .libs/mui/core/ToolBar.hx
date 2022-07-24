package mui.core;

enum abstract ToolbarVariant(String) 
{
	var Regular = "regular";
	var Dense = "dense";
}

typedef ToolBarClassProps<T> =
{
	?root: T,
	?gutters: T,
	?regular: T,
	?dense: T
}

typedef ToolBarProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: ToolBarClassProps<String>,
	?disableGutters: Bool,
	?variant: ToolbarVariant
}

@:jsRequire('@material-ui/core', 'Toolbar')
extern class ToolBar extends ReactComponentOfProps<ToolBarProps>
{
}

