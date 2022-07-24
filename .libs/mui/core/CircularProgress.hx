package mui.core;

import mui.common.Color.ColorPSI;

@:coreType abstract CircularProgressSize from String from Float {}

enum abstract CircularProgressVariant(String) 
{
	var Determinate = "determinate";
	var Indeterminate = "indeterminate";
	var Static = "static";
}

typedef CircularProgressClassProps<T> =
{
	?root: T,
	//?static: T,
	?indeterminate: T,
	?colorPrimary: T,
	?colorSecondary: T,
	?svg: T,
	?circle: T,
	?circleStatic: T,
	?circleIndeterminate: T,
	?circleDisableShrink: T
}

typedef CircularProgressProps = 
{
	>StandardDOMAttributes,
	?children: Noise,
	?classes: CircularProgressClassProps<String>,
	?color: ColorPSI,
	?disableShrink: Bool,
	?size: CircularProgressSize,
	?thickness: Float,
	?value: Float,
	?variant: CircularProgressVariant
}

@:jsRequire('@material-ui/core', 'CircularProgress')
extern class CircularProgress extends ReactComponentOfProps<CircularProgressProps>
{
}

