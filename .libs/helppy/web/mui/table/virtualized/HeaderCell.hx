package helppy.web.mui.table.virtualized;

import helppy.web.mui.label.HintedLabel;
import helppy.web.mui.table.virtualized.data.TableData.HeaderCellData;
import mui.common.Align;
import mui.core.TableCell;
import mui.core.TableSortLabel;
import mui.core.Typography;
import react.ReactMacro.jsx;

typedef HeaderCellProps = 
{
	>HeaderCellData,
	tableContext: TableContext,
	?style: Dynamic,
	?isHeader: Bool,
	?maxCharCount: Int,
	?onSortChange: (cellId: String, sortDirection: SortDirection) -> Void,
}

class HeaderCell extends BaseCell<HeaderCellProps>
{
	override function render() 
	{
		return super.render();
	}

	override function Content() 
	{
		return if (props.sortable)
		{
			final active = props.sortCellId == props.id ? true : false;
			final sortDir = getSortDirection();
			jsx('
				<$TableSortLabel active=${active}
					direction=${sortDir}
					data-sort=${sortDir}
					onClick=${onSortCellClick}>
					${getInnerContent()}
				</$TableSortLabel>	
			');
		}
		else
			getInnerContent();
	}
	
	function getInnerContent() 
	{
		return if (props.textWrap)
		{
			jsx('
				<$Typography variant=${TypographyVariant.H4}>
					${props.content}
				</$Typography>	
			');
		}
		else if (props.customContent)
		{
			jsx('<>${props.content}</>');
		}
		else
		{
			jsx('
				<$HintedLabel typographyVariant=${TypographyVariant.H4}
					atCursor=${true}
					maxCharCount=${props.maxCharCount}>
					${props.content}
				</$HintedLabel>	
			');
		}
	}

	function getSortDirection() 
	{
		return props.sortDirection != null ? props.sortDirection : SortDirection.Asc;
	}

	function onSortCellClick() 
	{
		final sortDir = getSortDirection();
		final newSortDir = switch sortDir
		{
			case SortDirection.Asc: SortDirection.Desc;
			case SortDirection.Desc: SortDirection.Asc;
			default: SortDirection.Asc;
		}
		if (props.onSortChange != null)
		{
			props.onSortChange(props.id, newSortDir);
		}
	}

	override function getVariant(): TableCellVariant 
	{
		return TableCellVariant.Head;	
	}
		
	override function getAlign(): Align
	{
		return props.align;	
	}
}