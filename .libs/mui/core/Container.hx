package mui.core;

import mui.common.Breakpoint.BreakpointOrFalse;

typedef ContainerClassProps<T> =
{
	?root: T,
	?disableGutters: T,
	?maxWidthXs: T,
	?maxWidthSm: T,
	?maxWidthMd: T,
	?maxWidthLg: T,
	?maxWidthXl: T
}

typedef ContainerProps = 
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: ContainerClassProps<String>,
	?component: ReactType,
	?fixed: Bool,
	?maxWidth: BreakpointOrFalse
};

@:jsRequire('@material-ui/core', 'Container')
extern class Container extends ReactComponentOfProps<ContainerProps>
{
}

