package mui.lab;

import mui.core.Paper.PaperProps;

enum abstract AlertColor(String) 
{
	var Error = "error";
	var Info = "info";
	var Success = "success";
	var Warning = "warning";
}

enum abstract AlertVariant(String) 
{
	var Filled = "filled";
	var Outlined = "outlined";
	var Standard = "standard";
}

typedef AlertClassProps<T> =
{
	?root: T,
	?standardSuccess: T,
	?standardInfo: T,
	?standardWarning: T,
	?standardError: T,
	?outlinedSuccess: T,
	?outlinedInfo: T,
	?outlinedWarning: T,
	?outlinedError: T,
	?filledSuccess: T,
	?filledInfo: T,
	?filledWarning: T,
	?filledError: T,
	?icon: T,
	?message: T,
	?action: T
}

typedef IconMapping = 
{
	?error: ReactFragment, 
	?info: ReactFragment, 
	?success: ReactFragment, 
	?warning: ReactFragment
}

typedef AlertProps = ForcedOverride<PaperProps, 
{
	?classes: AlertClassProps<String>,
	?action: ReactFragment,
	?closeText: String,
	?color: AlertColor,
	?icon: ReactFragment,
	?iconMapping: IconMapping,
	?onClose: HandlerOrVoid<Event -> Void>,
	?role: String,
	?severity: AlertColor,
	?variant: AlertVariant
}>;

@:jsRequire('@material-ui/lab/Alert', 'default')
extern class Alert extends ReactComponentOfProps<AlertProps>
{
}

