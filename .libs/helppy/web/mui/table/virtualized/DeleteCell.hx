package helppy.web.mui.table.virtualized;

import helppy.core.lang.Language;
import helppy.web.mui.hint.HintIcon;
import helppy.web.mui.table.virtualized.BaseCell;
import mui.common.Align;
import mui.common.Color;
import mui.core.IconButton;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import mui.icons.DeleteOutline;
import react.ReactMacro.jsx;

using helppy.core.lang.LangManager;

typedef DeleteCellProps =
{
	>BaseCellProps,
	?disabled: Bool,
	?onClick: Void -> Void,
}

class DeleteCell extends BaseCell<DeleteCellProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		iconButton:
		{
			padding: 0
		},
		icon:
		{
			width: theme.spacing(2.5),
			height: theme.spacing(2.5)
		}
	});

	public function new(props) 
	{
		super(props);
		_isControl = true;	
	}
	
	override function render() 
	{
		return super.render();
	}

	override function Content() 
	{		
		final classes = useStyle(props);
		final disabled = props.disabled != null ? props.disabled : false;
		final textId = props.isHeader ? "allDelete" : "delete";
		return jsx('
			<$HintIcon textId=${textId}>
				<$IconButton className=${classes.iconButton}
					name=${textId.getTextByLanguage(Language.RU)}
					color=${Color.Default}
					size=${IconButtonSize.Small}
					disabled=${disabled}
					onClick=${props.onClick}>
					<$DeleteOutline className=${classes.icon} />
				</$IconButton>
			</$HintIcon>
		');
	}

	override function getAlign(): Align
	{
		return Align.Center;	
	}
}