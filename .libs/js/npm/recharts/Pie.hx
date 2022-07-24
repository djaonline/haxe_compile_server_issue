package js.npm.recharts;

typedef PieProps = 
{
    data: Dynamic,
    cx: Float, 
    cy: Float, 
    labelLine: Bool,
    label: Dynamic,
    outerRadius: Float,
    fill: String
}

@:jsRequire("recharts", "Pie")
extern class Pie extends react.ReactComponent
{
}