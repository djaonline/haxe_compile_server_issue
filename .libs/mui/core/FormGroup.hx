package mui.core;

typedef FormGroupClassProps<T> = 
{
	?root: T,
	?row: T
}

typedef FormGroupProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: FormGroupClassProps<String>,
	?row: Bool
}

@:jsRequire('@material-ui/core', 'FormGroup')
extern class FormGroup extends ReactComponentOfProps<FormGroupProps>
{
}
