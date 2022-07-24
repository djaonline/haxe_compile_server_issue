package mui.core;

import mui.common.Color;

enum abstract LinearProgressVariant(String) 
{
	var Determinate = "determinate";
	var Indeterminate = "indeterminate";
	var Buffer = "buffer";
	var Query = "query";
}

typedef LinearProgressClassProps<T> =
{
	?root: T,
	?colorPrimary: T,
	?colorSecondary: T,
	?determinate: T,
	?indeterminate: T,
	?buffer: T,
	?query: T,
	?dashed: T,
	?dashedColorPrimary: T,
	?dashedColorSecondary: T,
	?bar: T,
	?barColorPrimary: T,
	?barColorSecondary: T,
	?bar1Indeterminate: T,
	?bar1Determinate: T,
	?bar1Buffer: T,
	?bar2Indeterminate: T,
	?bar2Buffer: T
}

typedef LinearProgressProps = 
{
	>StandardDOMAttributes,
	?children:Noise,
	?classes: LinearProgressClassProps<String>,
	?color:ColorPS,
	?value:Float,
	?valueBuffer:Float,
	?variant:LinearProgressVariant
}

@:jsRequire('@material-ui/core', 'LinearProgress')
extern class LinearProgress extends ReactComponentOfProps<LinearProgressProps> 
{
}

