package js.npm.recharts;

typedef LineProps = 
{
    type: String,
    dataKey: String,
    stroke: String,
}

@:jsRequire("recharts", "Line")
extern class Line extends react.ReactComponent
{
}