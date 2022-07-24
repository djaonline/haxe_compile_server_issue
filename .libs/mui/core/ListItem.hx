package mui.core;

import mui.core.ButtonBase.ButtonBaseProps;

enum abstract ListAlignItems(String) to String 
{
	var Center = "center";
	var FlexStart = "flex-start";
}

typedef ListItemClassProps<T> =
{
	?root: T,
	?container: T,
	?focusVisible: T,
	?dense: T,
	?alignItemsFlexStart: T,
	?disabled: T,
	?divider: T,
	?gutters: T,
	?button: T,
	?secondaryAction: T,
	?selected: T
}

typedef ListItemProps = ForcedOverride<ButtonBaseProps, 
{
	?alignItems: ListAlignItems,
	?autoFocus: Bool,
	?button: Bool,
	?classes: ListItemClassProps<String>,
	?component: ReactType,
	?ContainerComponent: ReactType,
	?ContainerProps: Dynamic,
	?dense: Bool,
	?disabled: Bool,
	?disableGutters: Bool,
	?divider: Bool,
	?selected: Bool
}>;


@:jsRequire('@material-ui/core', 'ListItem')
extern class ListItem extends ReactComponentOfProps<ListItemProps>
{
}

