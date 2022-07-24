package mui.core;

typedef DialogTitleClassProps<T> = 
{
	?root: T
}

typedef DialogTitleProps = 
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: DialogTitleClassProps<String>,
	?disableTypography: Bool
}

@:jsRequire('@material-ui/core', 'DialogTitle')
extern class DialogTitle extends ReactComponentOfProps<DialogTitleProps>
{
}

