package mui.lab;

typedef AutocompleteClassProps<T> =
{
	?root: T,
	?fullWidth: T,
	?focused: T,
	?tag: T,
	?tagSizeSmall: T,
	?hasPopupIcon: T,
	?hasClearIcon: T,
	?inputRoot: T,
	?input: T,
	?inputFocused: T,
	?endAdornment: T,
	?clearIndicator: T,
	?clearIndicatorDirty: T,
	?popupIndicator: T,
	?popupIndicatorOpen: T,
	?popper: T,
	?popperDisablePortal: T,
	?paper: T,
	?listbox: T,
	?loading: T,
	?noOptions: T,
	?option: T,
	?groupLabel: T,
	?groupUl: T

}

typedef AutocompleteProps =
{
	?classes: AutocompleteClassProps<String>,
	children: ReactFragment,
	options: Array<Dynamic>,
	renderInput: (params: Dynamic) -> ReactFragment,
	?getOptionLabel: (option: Dynamic) -> Dynamic
}

@:jsRequire('@material-ui/lab/Autocomplete', 'default')
extern class Autocomplete extends ReactComponentOfProps<Any> 
{
}
