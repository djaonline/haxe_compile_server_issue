package js.npm.react_split_pane;

import css.Properties;
import js.html.HtmlElement;
import react.Partial;
import react.ReactComponent;
import react.types.SyntheticEvent.MouseEvent;

typedef SplitPaneProps = 
{
	?allowResize: Bool,
	?className: String,
	?primary: PrimaryType,
	?minSize: Size,
	?maxSize: Size,
	?defaultSize: Size,
	?size: Size,
	?split: Split,
	?onDragStarted: () -> Void,
	?onDragFinished: (newSize: Int) -> Void,
	?onChange: (newSize: Int) -> Void,
	?onResizerClick: (event: MouseEvent<HtmlElement>) -> Void,
	?onResizerDoubleClick: (event: MouseEvent<HtmlElement>) -> Void,
	?style: Properties,
	?resizerStyle: Properties,
	?paneStyle: Properties,
	?pane1Style: Properties,
	?pane2Style: Properties,
	?resizerClassName: String,
	?step: Int
}

typedef SplitPaneState = 
{
	active: Bool,
	resized: Bool
}

@:jsRequire("react-split-pane", "default")
extern class SplitPane extends ReactComponentOfPropsAndState<SplitPaneProps, SplitPaneState>
{
	static function getSizeUpdate(props: SplitPaneProps, state: SplitPaneState): Partial<SplitPaneState>;
}

enum abstract PrimaryType(String) 
{
	var First = "first";
	var Second = "second";
}


