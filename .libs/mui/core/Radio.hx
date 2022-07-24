package mui.core;

import js.html.InputElement;

enum abstract RadioSize(String)
{
	var Small = 'small';
	var Medium = 'medium';
}

typedef RadioClassProps<T> =
{
	?root: T,
	?checked: T,
	?disabled: T,
	?colorPrimary: T,
	?colorSecondary: T
}

typedef RadioProps = 
{
	>StandardDOMAttributes,
	?classes: RadioClassProps<String>,
	?children: ReactFragment,
	?checked: Bool,
	?checkedIcon: ReactFragment,
	?color: Color,
	?disabled: Bool,
	?disableRipple: Bool,
	?icon: ReactFragment,
	?id: String,
	?inputProps: Dynamic,
	?inputRef: ReactRef<InputElement>,
	?name: String,
	?required: Bool,
	?size: RadioSize,
	?value: Any
}

@:jsRequire('@material-ui/core', 'Radio')
extern class Radio extends ReactComponentOfProps<RadioProps>
{
}

