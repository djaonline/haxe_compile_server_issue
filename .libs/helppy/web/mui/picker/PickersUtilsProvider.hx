package helppy.web.mui.picker;

import helppy.web.lang.view.LangLabel;
import js.npm.date_io.MomentUtils;
import mui.pickers.MuiPickersUtilsProvider;
import react.React;
import react.ReactComponent;
import redux.react.IConnectedComponent;
import react.ReactMacro.jsx;

typedef PickersUtilsProviderProps =
{
	children: ReactElement,
	?libInstance: Any,
	?utils: Class<MomentUtils>,
}

class PickersUtilsProvider extends ReactComponentOfProps<PickersUtilsProviderProps>
	implements IConnectedComponent
{
	override function render()
	{
		final picker = React.cloneElement(props.children, { okLabel: jsx('<$LangLabel textId="ok" />'), cancelLabel: jsx('<$LangLabel textId="cancel" />') });
		final utils = props.utils == null ? MomentUtils : props.utils;
		return jsx('
			<$MuiPickersUtilsProvider libInstance=${props.libInstance} utils=${utils}>
				${picker}
			</$MuiPickersUtilsProvider>
		');
	}
}