package js.npm.recharts;

typedef ScatterProps = 
{
    name: String,
    data: Dynamic
}

@:jsRequire("recharts", "Scatter")
extern class Scatter extends react.ReactComponent
{
}