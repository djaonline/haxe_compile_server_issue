package helppy.web.mui.list;

import helppy.core.data.ui.ItemData;
import helppy.core.lang.data.LocaleItemData;
import helppy.web.mui.label.FormLabel;
import helppy.web.mui.list.SimpleList.SimpleListProps;
import mui.core.Grid;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.React;
import react.ReactComponent;
import react.ReactFragment;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef FilterHandler = (value: String, items: Array<ItemData>) -> Array<ItemData>;
typedef SearchProvider = (value: String, onChange: String -> Void) -> ReactFragment;

typedef ListProps =
{
	>SimpleListProps,
	?titleTextId: String,
	?titleLocalItemData: LocaleItemData,
	?messageEmptyId: String,
	?messageNotFoundId: String,
	?selectable: Bool,
	?search: SearchProvider,
	?searchValue: String,
	?filter: FilterHandler,
	?width: String
}

typedef ListState =
{
	searchValue: String
}

class List extends ReactComponentOfPropsAndState<ListProps, ListState>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		container:
		{
			width: untyped props -> props.width
		}
	});

	public function new(props: ListProps) 
	{
		super(props);
		final searchValue = props.searchValue != null ? props.searchValue : "";
		state = { searchValue: searchValue };
	}

	override function render()
	{
		return jsx('<$ListImpl />');
	}

	function ListImpl()
	{
		final classes = useStyle(props);
		final items = if (props.filter != null)
			props.filter(state.searchValue, props.items);
		else
			props.items;
		final search = if (props.search != null)
			jsx('
				<$Grid item=${true} xs=${GridsNumber.Grids_12}>
					${props.search(state.searchValue, onSearchChange)}
				</$Grid>
			');
		else
			null;
		final messageTextId = if (items.length == 0)
			if (state.searchValue != null && state.searchValue != "")
				props.messageNotFoundId;
			else
				props.messageEmptyId;
		else
			null;
		return jsx('
			<$Grid className=${classes.container.addStyle(props)} 
				container=${true} spacing=${1}>
				<$Grid item=${true} xs=${GridsNumber.Grids_12}>
					<$FormLabel textId=${props.titleTextId}
						localItemData=${props.titleLocalItemData}
						variant=${FormLabelVariant.GREY}
						bold=${true} />
				</$Grid>
				${search}
				<$Grid item=${true} xs=${GridsNumber.Grids_12}>
					<$SimpleList items=${items}
						selectedIds=${props.selectedIds}
						disabledIds=${props.disabledIds}
						selectable=${props.selectable}
						selectAll=${props.selectAll}
						showSelectAllItem=${props.showSelectAllItem}
						disabled=${props.disabled}
						height=${props.height}
						messageTextId=${messageTextId}
						onSelect=${props.onSelect}
						onSelectAll=${props.onSelectAll} />
				</$Grid>
			</$Grid>
		');
	}

	function onSearchChange(value: String)
	{
		setState({ searchValue: value });
	}
}