package js.npm.recharts;

typedef ComposedChartProps = 
{
    width: Float,
    height: Float,
    data: Dynamic,
    margin: {top: Float, right: Float, bottom: Float, left: Float}
}

@:jsRequire("recharts", "ComposedChart")
extern class ComposedChart extends react.ReactComponent
{
}