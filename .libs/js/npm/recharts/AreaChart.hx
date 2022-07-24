package js.npm.recharts;

typedef AreaChartProps = 
{
	?width: Float,
	?height: Float,
	data: Dynamic
}

@:jsRequire("recharts", "AreaChart")
extern class AreaChart extends react.ReactComponent.ReactComponentOfProps<AreaChartProps>
{
}