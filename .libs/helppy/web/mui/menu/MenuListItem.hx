package helppy.web.mui.menu;

import helppy.web.mui.label.HintedLabel;
import helppy.core.data.tree.Tree.NodeData;
import helppy.core.data.tree.Tree.TreeNode;
import helppy.core.lang.data.LocaleItemData;
import helppy.web.ui.common.Selectable;
import mui.common.TransitionDuration;
import mui.core.Collapse;
import mui.core.List;
import mui.core.ListItem;
import mui.core.ListItemText;
import mui.core.Typography.TypographyVariant;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import mui.icons.ExpandLess;
import mui.icons.ExpandMore;
import react.ReactEvent;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef MenuListItemProps<T: NodeData> = 
{
	node: TreeNode<T>,
	level: Int,
	?onItemClick: (node: TreeNode<T>) -> Void,
	?endAdornment: Any,
	?children: Any
}

private typedef NodeWithChildrenProps =
{ 
	className: String,
	classes: Any,
	?name: String,
	children: Any,
	?selected: Bool,
	level: Int,
	localeItemData: LocaleItemData, 
	onClick: ?ReactEvent -> Void
} 

@:jsxStatic('render')
class MenuListItem
{
	static final useStyles = makeStyles((theme: DefaultTheme) -> 
	{
		bg:
		{
			backgroundColor: untyped props -> props.selected ? theme.palette.grey._100 : null,
			borderRadius: theme.spacing(0.5),
			marginBottom: untyped props -> props.level == 0 ? theme.spacing(1) : 0
		},
		item:
		{
			paddingTop: '4px',
			paddingBottom: '4px',
			borderRadius: theme.spacing(0.5),
		},
		title:
		{
			color: untyped props -> props.selected ? theme.palette.grey._900 : theme.palette.grey._700,
			paddingLeft: untyped props -> theme.spacing(props.level * 1.5),
			fontWeight: theme.typography.fontWeightMedium
		},
		subItem:
		{
			paddingTop: '2.5px',
			paddingBottom: '2.5px',
			borderRadius: theme.spacing(0.5),
		},
		subTitle:
		{
			fontSize: theme.typography.fontSize - 1,
			paddingLeft: untyped props -> theme.spacing(props.level * 1.5)
		},
		icon:
		{
			color: untyped props -> props.selected ? theme.palette.grey._700 : theme.palette.primary.main
		}
	});
	
	public static function render<T: NodeData>(props: MenuListItemProps<T>) 
	{
		final classes = useStyles(props);
		return 
			if (props.node.isLeaf())
			{
				final itemClasses = switch props.level
				{
					case 0:
					{
						bg: classes.bg,
						title: classes.title,
						item: classes.item
					}
					case _:
					{
						bg: null,
						title: classes.subTitle,
						item: classes.subItem
					}
				};
				final text = jsx('
					<$HintedLabel className=${itemClasses.title}
						typographyVariant=${TypographyVariant.Body1}
						localItemData=${props.node.name} />
				');
				jsx('
					<div className=${itemClasses.bg}>
						<$ListItem className=${itemClasses.item}
							button=${true}
							onClick=${onItemClick.bind(props)}>
							<$ListItemText name=${props.node.name.ru}
								primary=${text}/>
							${props.endAdornment}
						</$ListItem>
					</div>
				');
			}
			else 
				jsx('
					<$Selectable selected=${true}>
						<$NodeWithChildren name=${props.node.name.ru}
							level=${props.level}
							localeItemData=${props.node.name}>
							${props.children}
						</$NodeWithChildren>
					</$Selectable>
				');	
	}

	static function NodeWithChildren(props: NodeWithChildrenProps) 
	{
		final classes = useStyles(props);
		final openCloseIcon = props.selected ? jsx('<$ExpandLess className=${classes.icon} />') : jsx('<$ExpandMore className=${classes.icon} />');
		final text = jsx('
			<$HintedLabel className=${classes.title}
				typographyVariant=${TypographyVariant.Subtitle1}
				localItemData=${props.localeItemData} />
		');
		return jsx('
			<div className=${classes.bg}
				name=${'Категория меню ${props.name}'}>
				<$ListItem className=${classes.item.addStyle(props)}
					name=${props.name}
					button=${true} 
					onClick=${props.onClick}>
					<$ListItemText classes=${props.classes} 
						primary=${text} />
					${openCloseIcon}
				</$ListItem>
				<$Collapse in=${props.selected} 
					timeout=${TransitionDurationOrAuto.Auto}  
					unmountOnExit=${true}>
					<$List component="div" 
						disablePadding=${true}>
						${props.children}
					</$List>
				</$Collapse>
			</div>
	  ');
	}

	static function onItemClick<T: NodeData>(props: MenuListItemProps<T>) 
	{
		if (props.onItemClick != null)
		{
			props.onItemClick(props.node);
		}	
	}
}