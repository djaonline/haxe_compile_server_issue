package helppy.web.mui.menu;

import helppy.core.data.tree.Tree;
import mui.core.List;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactMacro.jsx;

typedef MenuListProps<T: NodeData> = 
{
	tree: Tree<T>,
	?getItemEndAdornment: (node: TreeNode<T>) -> Any,
	?onItemClick: (node: TreeNode<T>) -> Void,
}

@:jsxStatic('render')
class MenuList
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		root:
		{
			width: '100%',
			padding: theme.spacing(2, 2.5)
		}
	});

	public static function render(props: MenuListProps<NodeData>) 
	{
		final classes = useStyle();
		return jsx('
			<$List className=${classes.root}
				name="Меню"
				component="nav">
				${renderItems(props.tree.asNodeList(), props, 0)}
			</$List>
		');
	}

	static function renderItems(nodeList: Array<NodeData>, props: MenuListProps<NodeData>, level: Int) 
	{
		var items = [];
		var item: Any = null;
		for (nodeData in nodeList)
		{
			final node = new TreeNode(nodeData);
			final endAdornment = props.getItemEndAdornment != null ? props.getItemEndAdornment(node) : null;
			final children = node.isLeaf() ? null : renderItems(node.children, props, level + 1);
			item = jsx('
				<$MenuListItem key=${node.id}
					node=${node}
					level=${level}
					endAdornment=${endAdornment}
					onItemClick=${props.onItemClick}>
					${children}
				</$MenuListItem>
			');
			items.push(item);
		}
		return items;
	}
}