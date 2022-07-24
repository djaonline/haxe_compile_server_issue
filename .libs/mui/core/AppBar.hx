package mui.core;

import mui.core.Paper.PaperProps;

typedef AppBarClassProps<T> =
{
	?root: T,
	?positionFixed: T,
	?positionAbsolute: T,
	?positionSticky: T,
	?positionStatic: T,
	?positionRelative: T,
	?colorDefault: T,
	?colorPrimary: T,
	?colorSecondary: T,
	?colorInherit: T,
	?colorTransparent: T
}

typedef AppBarProps = ForcedOverride<
	PaperProps,
	{
		children: ReactFragment,
		?classes: AppBarClassProps<String>,
		?color: Color,
		?position: CSSPosition
	}
>;

@:jsRequire('@material-ui/core', 'AppBar')
extern class AppBar extends ReactComponentOfProps<AppBarProps>
{
}

