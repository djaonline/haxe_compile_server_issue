package mui.core;

typedef RadioGroupProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?defaultValue: Dynamic,
	?name: String,
	?value: Any
}

@:jsRequire('@material-ui/core', 'RadioGroup')
extern class RadioGroup extends ReactComponentOfProps<RadioGroupProps>
{
}

