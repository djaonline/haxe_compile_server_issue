package mui.core;

import mui.core.Paper.PaperProps;

typedef CardClassProps<T> = 
{
	?root: T,
}

typedef CardProps = ForcedOverride<PaperProps, {
	?classes: CardClassProps<String>,
	?raised:Bool
}>;

@:jsRequire('@material-ui/core', 'Card')
extern class Card extends ReactComponentOfProps<CardProps>
{
}

