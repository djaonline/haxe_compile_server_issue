package helppy.web.mui.table.virtualized;

import helppy.web.mui.table.virtualized.BaseCell;
import js.html.InputElement;
import mui.common.Align;
import mui.common.Color.ColorPS;
import mui.core.Checkbox;
import mui.core.IconButton.IconButtonSize;
import react.ReactMacro.jsx;
import react.types.SyntheticEvent.ChangeEvent;
import react.types.SyntheticEvent.MouseEvent;

typedef CheckboxCellProps =
{
	>BaseCellProps,
	checked: Bool,
	?disabled: Bool,
	?hiddenCheckbox: Bool,
	?onChecked: Bool -> Void,
}

class CheckboxCell extends BaseCell<CheckboxCellProps>
{
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
		final disabled = props.disabled != null ? props.disabled : false;
		final checked = props.checked != null ? props.checked : false;
		return if (!props.hiddenCheckbox)
			jsx('
				<$Checkbox color=${ColorPS.Primary}
					size=${IconButtonSize.Small}
					style=${{ padding: 0 }}
					disabled=${disabled}
					checked=${checked}
					onChange=${onChange}
					onClick=${onCheckboxClick}
					onDoubleClick=${onDoubleClick} />
			')
		else
			null;
	}

	override function getAlign(): Align
	{
		return Align.Center;	
	}

	function onChange(e: ChangeEvent<InputElement>) 
	{
		props.onChecked(e.target.checked);
	}
	
	function onDoubleClick(e: MouseEvent<InputElement>) 
	{
		e.stopPropagation();
	}

	function onCheckboxClick(e: MouseEvent<InputElement>) 
	{
		e.stopPropagation();
	}
}