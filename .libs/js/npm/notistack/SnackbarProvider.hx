package js.npm.notistack;

import js.html.HtmlElement;
import js.npm.notistack.Notistack.NotistackProps;
import react.ReactComponent;

typedef SnackbarProviderClasses = 
{
	?variantSuccess: Dynamic,
	?variantError: Dynamic,
	?variantWarning: Dynamic,
	?variantInfo: Dynamic,
	?root: String,
	?message: String
}

typedef SnackbarProviderProps = 
{
	>NotistackProps,
	?classes: SnackbarProviderClasses,
	?children: ReactElement,
	?dense: Bool,
	?domRoot: HtmlElement,
	?hideIconVariant: Bool,
	?iconVariant: IconVariant,
	?maxSnack: Int,
}

typedef IconVariant = Dynamic;

@:jsRequire('notistack', 'SnackbarProvider')
extern class SnackbarProvider extends ReactComponentOfProps<SnackbarProviderProps>
{
}
