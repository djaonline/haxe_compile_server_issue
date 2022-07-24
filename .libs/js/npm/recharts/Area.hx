package js.npm.recharts;

typedef AreaProps = 
{
	?type: String,
	?dataKey: String,
	?stroke: String,
	?fill: String
}

@:jsRequire("recharts", "Area")
extern class Area extends react.ReactComponent.ReactComponentOfProps<AreaProps>
{
}