package mui.core;

import mui.core.FormControl.FormControlVariant;

enum abstract InputAdornmentPosition(String) 
{
	var Start = "start";
	var End = "end";
}

typedef InputAdornmentClassProps<T> = 
{
	?root: T,
	?filled: T,
	?positionStart: T,
	?positionEnd: T,
	?disablePointerEvents: T,
	?hiddenLabel: T,
	?marginDense: T,
}

typedef InputAdornmentProps =
{
	>StandardDOMAttributes,
	children:ReactFragment,
	?classes: InputAdornmentClassProps<String>,
	?component: ReactType,
	?disablePointerEvents: Bool,
	?disableTypography: Bool,
	?position: InputAdornmentPosition,
	?variant: FormControlVariant,
}

@:jsRequire('@material-ui/core', 'InputAdornment')
extern class InputAdornment extends ReactComponentOfProps<InputAdornmentProps>
{
}

