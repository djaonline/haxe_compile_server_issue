package mui.core;

typedef DialogContentClassProps<T> = 
{
	?root: T,
	?dividers: T
}

typedef DialogContentProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: DialogContentClassProps<String>,
	?dividers: Bool
}

@:jsRequire('@material-ui/core', 'DialogContent')
extern class DialogContent extends ReactComponentOfProps<DialogContentProps>
{
}

