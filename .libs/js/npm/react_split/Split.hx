package js.npm.react_split;

import haxe.extern.EitherType;
import js.html.Element;
import react.ReactComponent;

typedef SplitProps = 
{
	?sizes: EitherType<Int, Array<Int>>,
	?minSize: EitherType<Int, Array<Int>>,
	?expandToMin: Bool,
	?gutterSize: Int,
	?gutterAlign: GutterAlign,
	?snapOffset: Int,
	?dragInterval: Int,
	?direction: Direction,
	?cursor: String,
	?gutter: (index: Int, direction: Direction, ?pairElement: Element) -> Element,
	?elementStyle: (dimension: String, elementSize: Int, gutterSize: Int, index: Int) -> Dynamic,
	?gutterStyle: (dimension: String, gutterSize: Int, index: Int) -> Dynamic,
	?onDrag: (sizes: Array<Int>) -> Void,
	?onDragStart: (sizes: Array<Int>) -> Void,
	?onDragEnd: (sizes: Array<Int>) -> Void
}

@:jsRequire("react-split")
extern class Split extends ReactComponentOfProps<SplitProps>
{
}

enum abstract GutterAlign(String) 
{
	var First = "center";
	var Start = "start";
	var End = "end";
}

enum abstract Direction(String) 
{
	var Horizontal = "horizontal";
	var Vertical = "vertical";
}