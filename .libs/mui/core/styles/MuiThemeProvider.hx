package mui.core.styles;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import react.ReactComponent;

typedef MuiThemeProviderProps = 
{
	children: ReactSingleFragment,
	theme: EitherType<Function, Dynamic> // TODO
}

@:jsRequire('@material-ui/core/styles', 'MuiThemeProvider')
extern class MuiThemeProvider extends ReactComponentOfProps<MuiThemeProviderProps> 
{}