package mui.core;

import mui.core.Button;

typedef ButtonBaseClassProps<T> =
{
	?root: T,
	?disabled: T,
	?focusVisible: T
}

typedef ButtonBaseProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: ButtonBaseClassProps<String>,
	?action: ButtonBaseActions->Void,
	?buttonRef: ReactRef<Any>,
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
};

@:jsRequire('@material-ui/core', 'ButtonBase')
extern class ButtonBase extends ReactComponentOfProps<ButtonBaseProps>
{
}

