package js.npm.react_grid_layout;

import js.html.Event;
import js.html.Element;
import js.html.MouseEvent;
import react.ReactComponent;

enum abstract CompactType(String) 
{
	var Vertical = 'vertical';
	var Horizontal = 'horizontal';
}

typedef LayoutItem = 
{
	?i: String, 
	x: Int, 
	y: Int, 
	w: Int, 
	h: Int,
	/**
	* Minimum height in grid units.
	*/
	?minW: Int,
	/**
	* Maximum width in grid units.
	*/
	?maxW: Int,
	/**
	* Minimum height in grid units.
	*/
	?minH: Int,

	/**
		* Maximum height in grid units.
	*/
	?maxH: Int,

	/**
		* set by DragEvents (onDragStart, onDrag, onDragStop) and ResizeEvents (onResizeStart, onResize, onResizeStop)
		*/
	?moved: Bool,

	/**
	* If true, equal to `isDraggable: false` and `isResizable: false`.
	*/
	//?static: Bool;

	/**
	* If false, will not be draggable. Overrides `static`.
	*/
	?isDraggable: Bool,

	/**
	* If false, will not be resizable. Overrides `static`.
	*/
	?isResizable: Bool
}

typedef Layout = Array<LayoutItem>;
typedef ItemCallback = (layout: Layout, oldItem: LayoutItem, newItem: LayoutItem,
	placeholder: LayoutItem, e: MouseEvent, element: Element) -> Void;

typedef GridLayoutProps =
{
	?className: String,
	// This allows setting the initial width on the server side.
	// This is required unless using the HOC <WidthProvider> or similar
	?width: Float,

	// If true, the container height swells and contracts to fit contents
	?autoSize: Bool,

	// Number of columns in this layout. Default: 12
	?cols: Int,

	// A CSS selector for tags that will not be draggable.
	// For example: draggableCancel:'.MyNonDraggableAreaClassName'
	// If you forget the leading . it will not work.
	?draggableCancel: String,

	// A CSS selector for tags that will act as the draggable handle.
	// For example: draggableHandle:'.MyDragHandleClassName'
	// If you forget the leading . it will not work.
	?draggableHandle: String,

	// If true, the layout will compact vertically
	?verticalCompact: Bool,

	// Compaction type. Default: 'vertical'
	?compactType: CompactType,

	// Layout is an array of object with the format:
	// {x: number, y: number, w: number, h: number}
	// The index into the layout must match the key used on each item component.
	// If you choose to use custom keys, you can specify that key in the layout
	// array objects like so:
	// {i: string, x: number, y: number, w: number, h: number}
	?layout: Layout, // If not provided, use data-grid props on children

	// Margin between items [x, y] in px. Default: [10, 10]
	?margin: Array<Float>,

	// Padding inside the container [x, y] in px. Default: margin
	?containerPadding: Array<Float>,

	// Rows have a static height, but you can change this based on breakpoints
	// if you like. Default: 150
	?rowHeight: Float,

	// Configuration of a dropping element. Dropping element is a "virtual" element
	// which appears when you drag over some element from outside.
	// It can be changed by passing specific parameters:
	//  i - id of an element
	//  w - width of an element
	//  h - height of an element
	?droppingItem: { i: String, w: Float, h: Float },
	
	?isDraggable: Bool,
	?isResizable: Bool,
	
	// Uses CSS3 translate() instead of position top/left.
	// This makes about 6x faster paint performance
	?useCSSTransforms: Bool,
	
	// If parent DOM node of ResponsiveReactGridLayout or ReactGridLayout has "transform: scale(n)" css property,
	// we should set scale coefficient to avoid render artefacts while dragging. Default: 1
	?transformScale: Float,

	// If true, grid items won't change position when being
	// dragged over. Default: false
	?preventCollision: Bool,

	// If true, droppable elements (with `draggable={true}` attribute)
	// can be dropped on the grid. It triggers "onDrop" callback
	// with position and event object as parameters.
	// It can be useful for dropping an element in a specific position
	//
	// NOTE: In case of using Firefox you should add
	// `onDragStart={e => e.dataTransfer.setData('text/plain', '')}` attribute
	// along with `draggable={true}` otherwise this feature will work incorrect.
	// onDragStart attribute is required for Firefox for a dragging initialization
	// @see https://bugzilla.mozilla.org/show_bug.cgi?id=568313
	// Default: false
	?isDroppable: Bool,

	//
	// Callbacks
	//

	// Callback so you can save the layout.
	// Calls back with (currentLayout) after every drag or resize stop.
	?onLayoutChange: (layout: Layout) -> Void,

	// Calls when drag starts.
	?onDragStart: ItemCallback,
	// Calls on each drag movement.
	?onDrag: ItemCallback,
	// Calls when drag is complete.
	?onDragStop: ItemCallback,
	// Calls when resize starts.
	?onResizeStart: ItemCallback,
	// Calls when resize movement happens.
	?onResize: ItemCallback,
	// Calls when resize is complete.
	?onResizeStop: ItemCallback,
	// Calls when some element has been dropped
	?onDrop: (elemParams: { x: Float, y: Float, w: Float, h: Float, e: Event }) -> Void
}

@:jsRequire('react-grid-layout')
extern class GridLayout extends ReactComponentOfProps<GridLayoutProps>
{
}
