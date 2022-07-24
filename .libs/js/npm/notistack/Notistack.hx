package js.npm.notistack;

import haxe.extern.EitherType;
import react.React.CreateElementType;
import react.ReactComponent.ReactElement;

private typedef KeyType = EitherType<String, Float>;

enum abstract VertPos(String)
{
	var Top = "top";
	var Bottom = "bottom";
}

enum abstract HorPos(String)
{
	var Left = "left";
	var Center = "center";
	var Right = "right";
}

enum abstract SnackVariant(String) 
{
	var Default  = "default";
	var Error = "error";
	var Success = "success";	
	var Warning = "warning";
	var Info = "info";
}

typedef NotistackSettings = 
{
	?action: ReactElement,
	?anchorOrigin: { vertical: VertPos, horizontal: HorPos },
	?onClose: (event: Dynamic, reason: Dynamic, key: KeyType) -> Void,
	?onExited: (event: Dynamic, key: KeyType) -> Void,
	?variant: SnackVariant,
}

typedef EnqueueSnackbarOpts = 
{
	>NotistackSettings,
	// Unique identifier to reference a snackbar.
	key: KeyType,
	// The number of milliseconds to wait before auto close
	?autoHideDuration: Int,
	// Snackbar stays on the screen, unless it is dismissed (programmatically or through user interaction).
	?persist: Bool,
}

typedef NotistackProps = 
{
	?enqueueSnackbar: (message: Any, ?opts: EnqueueSnackbarOpts) -> KeyType,
	?closeSnackbar: (?key: KeyType) -> Void
}

@:jsRequire('notistack')
extern class Notistack 
{
	static function withSnackbar(component: CreateElementType): CreateElementType;
}