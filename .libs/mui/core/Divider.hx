package mui.core;

enum abstract DividerVariant(String) to String 
{
	var FullWidth = "fullWidth";
	var Inset = "inset";
	var Middle = "middle";
}

typedef DividerClassProps<T> =
{
	?root: T,
	?absolute: T,
	?inset: T,
	?light: T,
	?middle: T,
	?vertical: T
}

typedef DividerProps = 
{
	>StandardDOMAttributes,
	?classes: DividerClassProps<String>,
	?absolute: Bool,
	?component: ReactType,
	?light: Bool,
	?orientation: Orientation,
	?variant: DividerVariant
};

@:jsRequire('@material-ui/core', 'Divider')
extern class Divider extends ReactComponentOfProps<DividerProps>
{
}

