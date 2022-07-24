package js.npm.recharts;

typedef PieChartProps = 
{
    width: Float,
    height: Float,
    onMouseEnter: Dynamic
}

@:jsRequire("recharts", "PieChart")
extern class PieChart extends react.ReactComponent
{
}