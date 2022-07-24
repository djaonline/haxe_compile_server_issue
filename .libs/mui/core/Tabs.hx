package mui.core;

import mui.common.Color;

enum abstract TabsVariant(String) to String 
{
	var Standard = "standard";
	var Scrollable = "scrollable";
	var FullWidth = "fullWidth";
}

typedef TabsActions = 
{
	var updateIndicator: Void -> Void;
}

enum abstract ScrollButtons(String) 
{
	var Auto = "auto";
	var Desktop = "desktop";
	var On = "on";
	var Off = "off";
}

typedef TabsClassProps<T> =
{
	?root: T,
	?vertical: T,
	?flexContainer: T,
	?flexContainerVertical: T,
	?centered: T,
	?scroller: T,
	?fixed: T,
	?scrollable: T,
	?scrollButtons: T,
	?scrollButtonsDesktop: T,
	?indicator: T
}

typedef TabsProps = ForcedOverride<StandardDOMAttributes, {
	?action: TabsActions->Void,
	?centered: Bool,
	?children: ReactFragment,
	?classes: TabsClassProps<String>,
	?component: ReactType,
	?indicatorColor: ColorPS,
	?onChange: HandlerOrVoid<(e: Event, value: Any) -> Void>,
	?orientation: Orientation,
	?ScrollButtonComponent: ReactType,
	?scrollButtons: ScrollButtons,
	?TabIndicatorProps: Dynamic,
	?textColor: ColorPSI,
	?value: Any,
	?variant: TabsVariant,
}>;

@:jsRequire('@material-ui/core', 'Tabs')
extern class Tabs extends ReactComponentOfProps<TabsProps>
{
}

