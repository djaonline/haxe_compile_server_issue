package mui.core;

enum abstract IconButtonEdge(Dynamic) 
{
	var Start = 'start';
	var End = 'end';
	var False = false;
}

enum abstract IconButtonSize(String) 
{
	var Small = "small";
	var Medium = "medium";
}

typedef IconButtonClassProps<T> =
{
	?root: T,
	?edgeStart: T,
	?edgeEnd: T, 
	?colorInherit: T,
	?colorPrimary: T,
	?colorSecondary: T,
	?disabled: T,
	?sizeSmall: T,
	?label: T
}

typedef IconButtonProps = 
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: IconButtonClassProps<String>,
	?color: Color,
	?disableFocusRipple: Bool,
	?disabled: Bool,
	?edge: IconButtonEdge,
	?size: IconButtonSize,
};

@:jsRequire('@material-ui/core', 'IconButton')
extern class IconButton extends ReactComponentOfProps<IconButtonProps>
{
}

