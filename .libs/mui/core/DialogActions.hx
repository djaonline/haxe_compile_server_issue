package mui.core;

typedef DialogActionsClassProps<T> = 
{
	?root: T,
	?spacing: T
}

typedef DialogActionsProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: DialogActionsClassProps<String>,
	?disableSpacing: Bool
}

@:jsRequire('@material-ui/core', 'DialogActions')
extern class DialogActions extends ReactComponentOfProps<DialogActionsProps>
{
}

