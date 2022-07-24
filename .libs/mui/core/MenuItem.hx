package mui.core;

import mui.core.ListItem.ListItemProps;

typedef MenuItemClassProps<T> = 
{ 
	?root: T,
	?gutters: T,
	?selected: T,
	?dense: T
}

typedef MenuItemProps = ForcedOverride<ListItemProps, 
{
	?classes: MenuItemClassProps<String>,
	?component: ReactType,
	?value: Any
}>

@:jsRequire('@material-ui/core', 'MenuItem')
extern class MenuItem extends ReactComponentOfProps<MenuItemProps>
{
}

