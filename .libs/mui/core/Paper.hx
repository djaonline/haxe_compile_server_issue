package mui.core;

enum abstract PaperVariant(String) 
{
	var Elevation = "elevation";
	var Outlined = "outlined";
}

typedef PaperClassProps<T> =
{
	?root: T,
	?rounded: T,
	?elevation0: T,
	?elevation1: T,
	?elevation2: T,
	?elevation3: T,
	?elevation4: T,
	?elevation5: T,
	?elevation6: T,
	?elevation7: T,
	?elevation8: T,
	?elevation9: T,
	?elevation10: T,
	?elevation11: T,
	?elevation12: T,
	?elevation13: T,
	?elevation14: T,
	?elevation15: T,
	?elevation16: T,
	?elevation17: T,
	?elevation18: T,
	?elevation19: T,
	?elevation20: T,
	?elevation21: T,
	?elevation22: T,
	?elevation23: T,
	?elevation24: T
}

typedef PaperProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: PaperClassProps<String>,
	?component: ReactType,
	?elevation: Int,
	?square: Bool,
	?variant: PaperVariant
};

@:jsRequire('@material-ui/core', 'Paper')
extern class Paper extends ReactComponentOfProps<PaperProps>
{
}

