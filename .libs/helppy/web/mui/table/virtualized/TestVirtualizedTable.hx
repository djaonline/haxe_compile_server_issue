package helppy.web.mui.table.virtualized;

import helppy.web.mui.table.virtualized.VirtualizedTable;
import helppy.web.mui.table.virtualized.data.TableData;
import react.PureComponent;
import react.ReactMacro.jsx;

class TestVirtualizedTable extends PureComponent
{
	override function render() 
	{
		return jsx('<$TableImpl />');
	}

	function TableImpl() 
	{
		final tableData: TableData = 
		{
			headers: getHeaders(),
			rows: getRows()
		}
		return jsx('
			<$VirtualizedTable data=${tableData} />
		');
	}

	function getHeaders(): HeaderRowData 
	{
		return 
		[
			{
				id: "currency",    
				content: "Валюта"
			},
			{
				id: "num",    
				content: "Номер"
			},
			{
				id: "balance",    
				content: "Баланс"
			},
		];
	}
/* 
	function getRows(): RowsData
	{
		return 
		[
			{
				rowId: '1',
				row: 
				[
					{
						id: "currency",    
						content: "USD"
					},
					{
						id: "num",    
						content: "40702810500007472160"
					},
					{
						id: "balance",    
						content: 100
					}
				]
			},
			{
				rowId: '2',
				row: 
				[
					{
						id: "currency",    
						content: "EUR"
					},
					{
						id: "num",    
						content: "40702810500007472161"
					},
					{
						id: "balance",    
						content: 200
					}
				],
			},
			{
				rowId: "3",
				row:
				[
					{
						id: "currency",    
						content: "RUBRUBRUBRUB3"
					},
					{
						id: "num",    
						content: "40702810500007472162"
					},
					{
						id: "balance",    
						content: 300
					}
				]
			}
		];
	} */

	function getRows(): RowsData
	{
		final rows = [];
		for (i in 0 ... 100)
		{
			final row: Array<CellData> =	
			[
				{
					id: "currency",    
					content: "USD"
				},
				{
					id: "num",    
					content: 40702810500007472160 + Std.string(i)
				},
				{
					id: "balance",    
					content: Math.round(100 + 1000 * Math.random())
				}
			];
			final rowData = { rowId: Std.string(i), row: row };
			rows.push(rowData);
		}
		return rows;
	}
}
