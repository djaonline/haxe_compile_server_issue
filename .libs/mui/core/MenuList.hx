package mui.core;

import mui.core.List.ListProps;
import mui.core.Menu.MenuVariant;

typedef MenuListProps = 
{
	>ListProps,
	?autoFocus: Bool,
	?autoFocusItem: Bool,
	?disableListWrap: Bool,
	?variant: MenuVariant,
};

@:jsRequire('@material-ui/core', 'MenuList')
extern class MenuList extends ReactComponentOfProps<MenuListProps>
{
}

