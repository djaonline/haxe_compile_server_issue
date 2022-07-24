package helppy.web.mui.table.virtualized;

import css.AlignItems;
import css.JustifyContent;
import css.Overflow.OverflowCompo;
import helppy.core.lang.Language;
import helppy.web.mui.hint.HintIcon;
import helppy.web.mui.input.SearchInput;
import helppy.web.mui.label.FormLabel;
import helppy.web.mui.table.virtualized.VirtualizedDsTable;
import helppy.widget.form.view.FormStyles;
import mui.common.Color;
import mui.core.Box;
import mui.core.Button;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import mui.icons.Add;
import react.ReactComponent;
import react.ReactMacro.jsx;

using helppy.core.lang.LangManager;
using helppy.web.util.CssUtil;
typedef VirtualizedExtDsTableProps =
{
	>VirtualizedDsTableProps,
	titleTextId: String,
	?titleVariant: FormLabelVariant,
	?searchable: Bool,
	?hideAddBtn: Bool,
	?addBtnDisabled: Bool,
	?customSearch: ReactElement,
	?customTable: ReactElement,
	?onSearchChange: String -> Void,
	?onSearchClick: String -> Void,
	onAddBtnClick: () -> Void
}

typedef VirtualizedExtDsTableState =
{
	searchValue: String
}

class VirtualizedExtDsTable extends ReactComponentOfPropsAndState<VirtualizedExtDsTableProps, VirtualizedExtDsTableState>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		toolbar:
		{
			display: 'flex',
			justifyContent: JustifyContent.Center,
			alignItems: untyped props -> props.searchable ? AlignItems.FlexEnd : AlignItems.Center,
			marginBottom: theme.spacing(1)
		},
		input:
		{
			marginTop: theme.spacing(1)
		},
		button:
		{
			height: untyped props -> props.searchable ? theme.spacing(5) : theme.spacing(4)
		},
		table:
		{
			boxShadow: FormStyles.TABLE_SHADOW_1,
			borderRadius: theme.spacing(0.5),
			overflow: OverflowCompo.Hidden,
			backgroundColor: theme.palette.common.white
		}
	});

	public function new() 
	{
		super();
		state = { searchValue: "" };
	}

	override function render() 
	{
		return jsx('<$TableImpl />');
	}

	function TableImpl()
	{
		final classes = useStyle(props);
		return jsx('
			<>
				<$Header />
				<$Box className=${classes.table.addStyle(props)}
					name="Таблица">
					<$Table />
				</$Box>
			</>
		');
	}

	function Search()
	{
		final classes = useStyle(props);
		return if (props.searchable != null)
		{
			if (props.customSearch != null)
			{
				props.customSearch;
			}
			else
			{
				jsx('
					<$SearchInput className=${classes.input}
						value=${state.searchValue}
						onSearchChange=${onSearchChange}
						onSearchClick=${props.onSearchClick} />
				');
			}
		}
		else
			null;
	}

	function Table()
	{
		return if (props.customTable == null)
			jsx('
				<$VirtualizedDsTable data=${props.data}
					keyFieldId=${props.keyFieldId}
					viewMode=${props.viewMode}
					onSortChange=${props.onSortChange}
					displayedColIds=${props.displayedColIds}
					displayedMessageId=${props.displayedMessageId}
					onRowSelected=${props.onRowSelected}
					onSelectedAll=${props.onSelectedAll}
					selectionDisabled=${props.selectionDisabled}
					selectedRowIds=${props.selectedRowIds}
					allSelected=${props.allSelected}
					bodyColWidth=${props.bodyColWidth}
					bodyColWidthMap=${props.bodyColWidthMap}
					headerTextWrap=${props.headerTextWrap}
					bodyTextWrap=${props.bodyTextWrap}
					getHeaderCellContent=${props.getHeaderCellContent}
					getBodyCellContent=${props.getBodyCellContent}
					onRowClick=${props.onRowClick}
					onRowDoubleClick=${props.onRowDoubleClick}
					onRowDeleteClick=${props.onRowDeleteClick}
					onDeleteAll=${props.onDeleteAll}
					maxCellCharCount=${props.maxCellCharCount} />
			')
		else
		{
			props.customTable;
		}
	}

	function Header()
	{
		final classes = useStyle(props);
		final leftToolbarSize = props.hideAddBtn ? "100%" : "85%";
		return if (props.titleTextId != null || !props.hideAddBtn)
		{
			jsx('
				<$Box className=${classes.toolbar}>
					<$Box width=${leftToolbarSize}
						marginRight=${props.hideAddBtn ? 0 : 1}>
						<$FormLabel textId=${props.titleTextId}
							variant=${props.titleVariant}
							bold=${true} />
						<$Search />
					</$Box>
					<$ButtonAdd />
				</$Box>
			');
		}
		else
		{
			null;
		}
	}

	function ButtonAdd()
	{
		final classes = useStyle(props);
		return if (!props.hideAddBtn)
			jsx('
				<$Box width="15%">
					<$HintIcon textId="add">
						<$Button className=${classes.button}
							name=${"add".getTextByLanguage(Language.RU)}
							color=${Color.Primary}
							variant=${ButtonVariant.Contained}
							fullWidth=${true}
							disabled=${props.addBtnDisabled}
							onClick=${props.onAddBtnClick}>
							<$Add />
						</$Button>
					</$HintIcon>
				</$Box>
			');
		else
			null;
	}

	function onSearchChange(value: String)
	{
		setState({ searchValue: value });
		if (props.onSearchChange != null)
			props.onSearchChange(value);
	}
}