package mui.core;

typedef CardActionsClassProps<T> =
{
	?root: T,
	?spacing: T
}

typedef CardActionsProps = 
{
	>StandardDOMAttributes,
	?children: ReactFragment,
	?classes: CardActionsClassProps<String>,
	?disableSpacing: Bool
}

@:jsRequire('@material-ui/core', 'CardActions')
extern class CardActions extends ReactComponentOfProps<CardActionsProps>
{
}

