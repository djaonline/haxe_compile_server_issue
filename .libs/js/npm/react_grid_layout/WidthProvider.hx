package js.npm.react_grid_layout;

@:jsRequire('react-grid-layout', 'WidthProvider')
extern class WidthProvider
{
	@:selfCall static function wrap(GRL: Class<GridLayout>): Any;
}
