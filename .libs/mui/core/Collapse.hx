package mui.core;

typedef CollapseClassProps<T> =
{
	?container: T,
	?entered: T,
	?hidden: T,
	?wrapper: T,
	?wrapperInner: T
}

typedef CollapseProps =
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: CollapseClassProps<String>,
	?collapsedHeight: String,
	?component: ReactType,
	// ?in:Bool, // Reserved keyword
	?timeout: TransitionDuration
};


@:jsRequire('@material-ui/core', 'Collapse')
extern class Collapse extends ReactComponentOfProps<CollapseProps>
{
}

