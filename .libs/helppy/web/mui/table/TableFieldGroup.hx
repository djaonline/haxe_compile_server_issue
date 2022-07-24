package helppy.web.mui.table;

import helppy.web.mui.label.FormLabel;
import helppy.web.mui.table.SimpleTable;
import mui.core.Grid;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.PureComponent;
import react.ReactMacro.jsx;
import ru.prime.widgetengine.data.field.FieldId;
import ru.prime.widgetengine.data.field.Fields;

typedef TableFieldGroupProps = 
{
	>SimpleTableProps,
	titleTextId: String,
	fields: Fields
}

class TableFieldGroup extends PureComponentOfProps<TableFieldGroupProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		title:
		{
			marginBottom: theme.spacing(1)
		}
	});
	
	override function render() 
	{
		return jsx('<$TableFieldGroupImpl />');
	}

	function TableFieldGroupImpl()
	{
		final classes = useStyle();
		return jsx('
			<$Grid container=${true}>
				<$Grid item=${true} xs=${Grids_12}>
					<$FormLabel className=${classes.title}
						textId=${props.titleTextId}
						variant=${FormLabelVariant.LIGHT_GREY}
						bold=${true}
						addAsterisk=${allFieldsIsRequired()} />
				</$Grid>
				<$Grid item=${true} xs=${Grids_12}>
					<$SimpleTable headers=${props.headers}
						rows=${props.rows}
						headersAlign=${props.headersAlign} />
				</$Grid>
			</$Grid>
		');	
	}

	function allFieldsIsRequired(): Bool
	{
		for (i in 0...props.rows.length) 
		{
			final row = props.rows[i];
			for (i in 0...row.length) 
			{
				final rowData = row[i];
				final fieldId = new FieldId(rowData.cellId);
				if (rowData.cellId != null && !props.fields.getFieldData(fieldId).isRequired())
					return false;
			}
		}
		return true;
	}
}