package js.npm.simplebar_react;

typedef SimpleBarProps = 
{
	?autoHide: Bool
}

@:jsRequire("simplebar-react")
extern class SimpleBar extends react.ReactComponent.ReactComponentOfProps<SimpleBarProps>
{
}