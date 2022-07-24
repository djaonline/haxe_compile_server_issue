package mui.core;

typedef BoxProps = 
{
	>StandardDOMAttributes,
	>Properties,
	?displayPrint: String,
	children: ReactFragment,
	?clone: Bool,
	?component: ReactType
};

@:jsRequire('@material-ui/core', 'Box')
extern class Box extends ReactComponentOfProps<BoxProps>
{
}

