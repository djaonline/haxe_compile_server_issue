package helppy.web.mui.adornment;

import helppy.web.mui.adornment.Adornment;
import react.ReactMacro.jsx;

typedef BaseAdornmentProps = 
{
	?startAdornment: Any,
	?startAdornmentText: String,
	?startAdornmentTextId: String,
	?endAdornment: Any,
	?endAdornmentText: String,
	?endAdornmentTextId: String
}

@:forward
abstract ExtBaseAdornmentProps(BaseAdornmentProps) 
	from BaseAdornmentProps to BaseAdornmentProps
{
	public function getComp(start: Bool, useForInput: Bool) 
	{
		var content = this.endAdornment;
		var text = this.endAdornmentText;
		var textId = this.endAdornmentTextId;
		var kind = AdornmentKind.END;
		if (start)
		{
			content = this.startAdornment;
			text = this.startAdornmentText;
			textId = this.startAdornmentTextId;
			kind = AdornmentKind.START;
		}
		return 
			jsx('
				<$Adornment useForInput=${useForInput}
					kind=${kind}
					text=${text}
					textId=${textId}
					content=${content} />
			');
	}

	public inline function hasStartAdornment(): Bool
	{
		return 
			this.startAdornment != null || this.startAdornmentText != null || this.startAdornmentTextId != null;
	}

	public inline function hasEndAdornment(): Bool
	{
		return 
			this.endAdornment != null || this.endAdornmentText != null || this.endAdornmentTextId != null;
	}
}