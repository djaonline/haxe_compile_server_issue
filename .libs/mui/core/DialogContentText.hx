package mui.core;

typedef DialogContentTextClassProps<T> = 
{
	?root: T
}

typedef DialogContentTextProps = 
{
	?classes: DialogContentTextClassProps<String>,
}

@:jsRequire('@material-ui/core', 'DialogContentText')
extern class DialogContentText extends ReactComponentOfProps<DialogContentTextProps>
{
}

