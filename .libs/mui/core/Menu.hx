package mui.core;

import mui.core.MenuList.MenuListProps;
import mui.core.Popover.PopoverClassProps;
import mui.core.Popover.PopoverProps;

enum abstract MenuVariant(String) 
{
	var Menu_ = "menu";
	var SelectedMenu = "selectedMenu";
}

typedef MenuClassProps<T> = 
{ 
	?paper: T,
	?list: T
}

typedef MenuProps = ForcedOverride<PopoverProps, 
{
	?classes: MenuClassProps<String>,
	?autoFocus: Bool,
	?disableAutoFocusItem: Bool,
	?MenuListProps: Partial<MenuListProps>,
	?PopoverClasses: PopoverClassProps<String>,
	?variant: MenuVariant,
}>

@:jsRequire('@material-ui/core', 'Menu')
extern class Menu extends ReactComponentOfProps<MenuProps>
{
}

