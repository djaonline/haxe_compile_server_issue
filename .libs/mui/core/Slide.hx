package mui.core;

import react.transition.Transition;

typedef SlideProps = 
{
	>TransitionProps<Any>,
	>StandardDOMAttributes,
	?direction: Direction
};

@:acceptsMoreProps
@:jsRequire('@material-ui/core', 'Slide')
extern class Slide extends ReactComponentOfProps<SlideProps>
{
}

