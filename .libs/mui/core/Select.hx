package mui.core;

import mui.core.FormControl.FormControlVariant;
import mui.core.Input.InputProps;
import mui.core.Menu.MenuProps;

typedef SelectClassProps<T> =
{
	?root: T,
	?select: T,
	?filled: T,
	?outlined: T,
	?selectMenu: T,
	?disabled: T,
	?icon: T,
	?iconOpen: T,
	?iconFilled: T,
	?iconOutlined: T
}

typedef SelectProps<TData> = ForcedOverride<InputProps, 
{
	?autoWidth: Bool,
	?children: ReactFragment,
	?classes: SelectClassProps<String>,
	?displayEmpty: Bool,
	?IconComponent: ReactType,
	?input: ReactSingleFragment,
	?labelId: String,
	?labelWidth: Int,
	?MenuProps: Partial<MenuProps>,
	?multiple: Bool,
	?native: Bool,
	?onChange: HandlerOrVoid<Event->ReactElement-> Void>,
	?onClose: HandlerOrVoid< ClassicHandler>,
	?onOpen:HandlerOrVoid< ClassicHandler>,
	?open: Bool,
	?renderValue: TData -> ReactFragment,
	?SelectDisplayProps: Dynamic,
	?value: TData,
	?variant: FormControlVariant
}>

@:jsRequire('@material-ui/core', 'Select')
extern class Select<TData> extends ReactComponentOfProps<SelectProps<TData>>
{
}

