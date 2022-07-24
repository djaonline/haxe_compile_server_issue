package js.npm.resizable;

import js.html.HtmlElement;

@:jsRequire("react-resizable", "Resizable")
extern class Resizable 
{
}

typedef ResizableProps = 
{
  children: Any,
  width: Float,
  height: Float,
  // If you change this, be sure to update your css
  handleSize: Array<Float>,
  lockAspectRatio: Bool,
  axis: Axis,
  minConstraints: Array<Float>,
  maxConstraints: Array<Float>,
  ?onResizeStop: ResizableEvent,
  ?onResizeStart: ResizableEvent,
  ?onResize: ResizableEvent,
  ?draggableOpts: Dynamic
};

typedef ResizableEvent = Dynamic -> ResizeCallbackData -> Void;

typedef ResizeCallbackData = 
{
  node: HtmlElement,
  size: {width: Float, height: Float}
};


extern enum abstract Axis(String)
{
	var Both = 'both';
	var X = 'x';
	var Y = 'y';
	var None = 'none';
}