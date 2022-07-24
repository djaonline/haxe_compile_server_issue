package helppy.web.mui.panel.nav;

import helppy.web.mui.btn.NavButton;
import react.ReactMacro.jsx;

typedef NavPanelProps = 
{
	pageNum: Int,
	pageCount: Int,
	onNavigate: (dir: NavDirection) -> Void,
	?disabled: Bool,
}

@:jsxStatic('render')
class NavPanel 
{
	public static function render(props: NavPanelProps) 
	{
		final disabled = props.disabled != null ? props.disabled : false;
		final prevDisabled = disabled || props.pageNum == 1;
		final nextDisabled = disabled || props.pageNum == props.pageCount;
		return jsx('
			<>
				<$NavButton direction=${NavDirection.First} 
					disabled=${prevDisabled}
					onClick=${props.onNavigate} />
				<$NavButton direction=${NavDirection.Prev}
					disabled=${prevDisabled} 
					onClick=${props.onNavigate} />
				<$NavButton direction=${NavDirection.Next}
					disabled=${nextDisabled}
					onClick=${props.onNavigate} />
				<$NavButton direction=${NavDirection.Last}
					disabled=${nextDisabled || props.pageCount == -1}
					onClick=${props.onNavigate} />
			</>
		');
	}
}