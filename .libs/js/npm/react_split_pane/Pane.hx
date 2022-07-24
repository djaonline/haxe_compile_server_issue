package js.npm.react_split_pane;

import css.Properties;
import js.html.DivElement;
import react.ReactComponent;

typedef PaneProps = 
{
	?className: String,
	?size: Size,
	?split: Split,
	?style: Properties,
	?eleRef: (el: DivElement) -> Void
}

@:jsRequire("react-split-pane", "Pane")
extern class Pane extends ReactComponentOfProps<PaneProps>
{
}