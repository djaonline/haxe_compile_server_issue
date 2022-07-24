package js.npm.recharts;

typedef BarProps = 
{
    dataKey: String,
    barSize: Float,
    fill: String
}

@:jsRequire("recharts", "Bar")
extern class Bar extends react.ReactComponent
{
}