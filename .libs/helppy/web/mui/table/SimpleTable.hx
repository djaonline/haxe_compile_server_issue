package helppy.web.mui.table;

import css.TextAlign;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.PureComponent;
import react.ReactFragment;
import react.ReactMacro.jsx;

typedef Headers = Array<Header>;

typedef Header =
{
	content: Any,
	?width: Any
} 

typedef Rows = Array<Row>;

typedef Row = Array<RowData>;

typedef RowData =
{
	?cellId: String,
	getContent: (?cellId: String) -> Any
} 

typedef SimpleTableProps =
{
	headers: Headers,
	rows: Rows,
	?headersAlign: TextAlign
}

class SimpleTable extends PureComponentOfProps<SimpleTableProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		header:
		{
			padding: theme.spacing(0, 1),
			textAlign: untyped props -> props.headersAlign
		},
		cell:
		{
			padding: theme.spacing(0.5, 1)
		}
	});
	
	override function render() 
	{
		return jsx('<$SimpleTableImpl />');
	}

	function SimpleTableImpl()
	{
		return jsx('
			<table>
				<thead>
					<tr>
						${getHeaders()}
					</tr>
				</thead>
				<tbody>
					${getRows()}
				</tbody>
			</table>
		');	
	}

	function getHeaders(): Array<ReactFragment>
	{
		final classes = useStyle(props);
		return
		[
			for (i in 0...props.headers.length) 
			{
				final header = props.headers[i];
				jsx('
					<th className=${classes.header} 
						key=${i}
						style=${{ width: header.width }}>
						${header.content}
					</th>
				');
			}
		];
	}

	function getRows(): Array<ReactFragment>
	{
		return
		[
			for (i in 0...props.rows.length) 
			{
				jsx('<tr key=${i}>${getRow(props.rows[i])}</tr>');
			}
		];
	}

	function getRow(row: Row): Array<ReactFragment>
	{
		final classes = useStyle();
		return
		[
			for (i in 0...row.length) 
			{
				final rowData = row[i];
				jsx('
					<th key=${i} 
						className=${classes.cell}>
						${rowData.getContent(rowData.cellId)}
					</th>
				');
			}
		];
	}
}