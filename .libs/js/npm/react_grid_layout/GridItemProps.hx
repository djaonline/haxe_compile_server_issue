package js.npm.react_grid_layout;

typedef GridItemProps = 
{
	 // A string corresponding to the component key
	?i: String,
	 // These are all in grid units, not pixels
	?x: Float,
	?y: Float,
	?w: Float,
	?h: Float,
	?minW: Float, // 0
	?maxW: Float, // Infinity
	?minH: Float, // 0
	?maxH: Float, // Infinity
   
	 // If true, equal to `isDraggable: false, isResizable: false`. Default: false
	//?static_: Bool,
	 // If false, will not be draggable. Overrides `static`.
	?isDraggable: Bool, // true
	 // If false, will not be resizable. Overrides `static`.
	?isResizable: Bool // true
}
