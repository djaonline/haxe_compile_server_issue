package mui.core;

typedef CardContentClassProps<T> = 
{
	?root: T,
}

typedef CardContentProps = 
{
	>StandardDOMAttributes,
	?children:ReactFragment,
	?classes: CardContentClassProps<String>,
	?component:ReactType
}

@:jsRequire('@material-ui/core', 'CardContent')
extern class CardContent extends ReactComponentOfProps<CardContentProps>
{
}

