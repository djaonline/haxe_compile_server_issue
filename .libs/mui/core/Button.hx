package mui.core;

enum abstract ButtonSize(String)
{
	var Small = 'small';
	var Medium = 'medium';
	var Large = 'large';
}

enum abstract ButtonVariant(String)
{
	var Text = "text";
	var Outlined = "outlined";
	var Contained = "contained";
}

enum abstract ButtonType(String) 
{
	var Button_ = "button"; //to avoid component name conflict
	var Submit = "submit";
	var Reset = "reset";
}

typedef ButtonClassProps<T> =
{
	root: T,
	label: T,
	text: T,
	textPrimary: T,
	textSecondary: T,
	outlined: T,
	outlinedPrimary: T,
	outlinedSecondary: T,
	contained: T,
	containedPrimary: T,
	containedSecondary: T,
	focusVisible: T,
	disabled: T,
	colorInherit: T,
	textSizeSmall: T,
	textSizeLarge: T,
	outlinedSizeSmall: T,
	outlinedSizeLarge: T,
	containedSizeSmall: T,
	containedSizeLarge: T,
	sizeSmall: T,
	sizeLarge: T,
	fullWidth: T,
	startIcon: T,
	endIcon: T,
	iconSizeSmall: T,
	iconSizeMedium: T,
	iconSizeLarge: T,
}

typedef ButtonBaseActions = 
{
	var focusVisible: Void -> Void;
}

typedef ButtonProps = 
{
	>StandardDOMAttributes,
	children: ReactFragment,
	?classes: ButtonClassProps<String>,
	?color: Color,
	?disableElevation: Bool,
	?disableFocusRipple: Bool,
	?endIcon: ReactFragment,
	?fullWidth: Bool,
	?href: String,
	?startIcon: ReactFragment,
	?size: ButtonSize,
	?variant: ButtonVariant,
	?action: ButtonBaseActions -> Void,
	?buttonRef: ReactRef<DOMElement>,
	?centerRipple: Bool,
	?component: ReactType,
	?disabled: Bool,
	?disableRipple: Bool,
	?disableTouchRipple: Bool,
	?focusRipple: Bool,
	?focusVisibleClassName: String,
	?onFocusVisible: HandlerOrVoid<ClassicHandler>,
	?TouchRippleProps: Dynamic,
	?type: ButtonType,
	?tabIndex:Int
};

@:jsRequire('@material-ui/core', 'Button')
extern class Button extends ReactComponentOfProps<ButtonProps>
{
}

