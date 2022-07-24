package helppy.web.mui.table.virtualized;

import helppy.web.mui.label.HintedLabel;
import helppy.web.mui.table.virtualized.data.TableData.CellData;
import js.npm.glamor.Css;
import mui.common.Align;
import mui.core.TableCell.TableCellVariant;
import mui.core.Typography;
import react.ReactMacro.jsx;

typedef BodyCellProps = 
{
	>CellData,
	tableContext: TableContext,
	?style: Dynamic,
	?isHeader: Bool,
	?maxCharCount: Int,
}

class BodyCell extends BaseCell<BodyCellProps>
{
	override function render() 
	{
		return super.render();
	}

	override function Content() 
	{
		final labelStyle = Css.style({
			width: props.width != null ? props.width : "auto"
		});
		return if (props.textWrap)
		{
			jsx('
				<$Typography className=${labelStyle}
					variant=${TypographyVariant.Body2}>
					${props.content}
				</$Typography>	
			');
		}
		else if (props.customContent)
		{
			jsx('
				<div className=${labelStyle}>
					${props.content}
				</div>
			');
		}
		else
		{
			jsx('
				<$HintedLabel className=${labelStyle}
					typographyVariant=${TypographyVariant.Body2}
					atCursor=${true}
					maxCharCount=${props.maxCharCount}>
					${props.content}
				</$HintedLabel>
			');
		}
	}

	override function getVariant(): TableCellVariant 
	{
		return TableCellVariant.Body;
	}
	
	override function getAlign(): Align
	{
		return props.align;
	}
}
