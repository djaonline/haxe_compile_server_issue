package helppy.web.mui.menu;

import css.Overflow;
import css.TextTransform;
import helppy.core.lang.Language;
import helppy.web.lang.view.LangLabel;
import mui.common.Color.ColorPSI;
import mui.core.Tab;
import mui.core.Tabs;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.React;
import react.ReactComponent;
import react.ReactEvent;
import react.ReactMacro.jsx;
import redux.react.IConnectedComponent;

using helppy.core.lang.LangManager;

typedef TabData =
{
	id: String,
	content: Any,
	?disabled: Bool
}

typedef TabMenuProps =
{
	tabs: Array<TabData>,
	?height: String
}

typedef TabMenuState =
{
	value: Int
}

class TabMenu extends ReactComponentOfPropsAndState<TabMenuProps, TabMenuState>
	implements IConnectedComponent
{
	var initedTabs: Map<Int, Bool> = new Map();

	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		tabs: 
		{
			marginBottom: theme.spacing(3)
		},
		tab:
		{
			textTransform: TextTransform.UpperCase,
			minWidth: 'fit-content'
		},
		content:
		{
			height: untyped props -> props.height,
			overflowY: Overflow.Auto,
			overflowX: Overflow.Hidden
		}
	});

	public function new()
	{
		super();
		state = { value: 0 };
	}

	override function render() 
	{
		return jsx('<$TabMenuImpl />');
	}
	
	function TabMenuImpl()
	{
		final classes = useStyle();
		return jsx('
			<>
				<$Tabs className=${classes.tabs}
					value=${state.value}
					name="Вкладки"
					variant=${TabsVariant.Scrollable}
					onChange=${onChange}
					indicatorColor=${ColorPSI.Primary}
					textColor=${ColorPSI.Primary}
					scrollButtons=${ScrollButtons.Auto}>
					${getTabs()}
				</$Tabs>
				${getContents()}
			</>
		');
	}

	inline function getTabs()
	{
		final classes = useStyle();
		return
		[
			for (i in 0...props.tabs.length) 
			{
				final tab = props.tabs[i];
				jsx('
					<$Tab key=${tab.id}
						className=${classes.tab}
						name=${getName(tab)}
						label=${jsx('<$LangLabel textId=${tab.id} />')}
						disabled=${tab.disabled} />
				');
			}
		];
	}

	inline function getContents()
	{
		return
		[
			for (i in 0...props.tabs.length) 
			{
				final tab = props.tabs[i];
				final name = 'Содержимое вкладки - ${getName(tab)}';
				if (state.value == i)
				{
					initedTabs.set(i, true);
				}
				if (initedTabs.get(i))
				{
					jsx('
						<$TabContent key=${tab.id}
							index=${i}
							name=${name}>
							${tab.content}
						</$TabContent>
					');
				}
				else
				{
					null;
				}
			}
		];
	}

	inline function getName(tab: TabData): String
	{
		return tab.id.getTextByLanguage(Language.RU);
	}

	function TabContent(tabProps: { children: Any, index: Int, name: String })
	{
		final classes = useStyle(props);
		return jsx('
			<div className=${props.height != null ? classes.content : null}
				hidden=${state.value != tabProps.index}
				name=${tabProps.name}>
				${tabProps.children}
			</div>
		');
	}

	function onChange(e: ReactEvent, value: Int)
	{
		setState({ value: value });
	}
}