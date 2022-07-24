package helppy.web.lang.view;

import lib.core.lang.LangManager;
import lib.core.lang.Language;
import lib.core.lang.data.LocaleItemData;
//import lib.web.lang.LangApplicationState;
import js.html.HtmlElement;
import react.Fragment;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.ReactUtil;
import redux.react.IConnectedComponent;

using helppy.web.util.CssUtil;

/**
 * ...
 * @author Alexander Djafarov
 */

typedef LangLabelState = 
{
	lang: Language
}

typedef LangLabelProps = 
{
	?name: String, // name property is necessary for ui testing
	?localItemData: LocaleItemData,
	?textId: String,
	?text: String,
	?lang: Language,
	?params: Array<ParamData>, // params to replace {0},{1}... in string pattern
	?option: Bool, // render as <option/>
	?value: String,
	?hint: Any,
	?textHandler: TextHandler,
	?children: Any
}

typedef ParamData = 
{
	var ?text: String;
	var ?textId: String;
	var ?lang: Language;
	var ?style: Any;
}
 
class LangLabel extends ReactComponentOfPropsAndState<LangLabelProps, LangLabelState> 
	implements IConnectedComponent
{
	public static var defaultProps = 
	{
		option: false
	}
	
	public var container: HtmlElement;
	
	function mapState(state: LangApplicationState, props: LangLabelProps)
	{
		var lang = props.lang != null ? props.lang : state.langState.lang;
		return 
		{
			lang: lang
		}
	}
	
	override public function render()
	{
		var text: String = getText(); 
		var textComp: Any = text;
		if (props.text != null)
		{
			textComp = props.text;
		}
		if (props.params != null)
		{
			var jsxTextItems = [];
			var jsxTextItem = null;
			var itemKeyIndex = 0;
			
			for (i in 0 ... props.params.length)
			{
				var paramData = props.params[i];
				var textItems = text.split('{$i}');
				var jsxTextItem = jsx('
					<$Fragment key=${Std.string(itemKeyIndex)}>
						${textItems[0]}
					</$Fragment>
				');
				itemKeyIndex++;
				jsxTextItems.push(jsxTextItem);
				text = textItems[0];
				if (textItems.length > 1)
				{
					jsxTextItem = 
					if (paramData.textId == null)
					{
						jsx('
							<span key=${Std.string(itemKeyIndex)}
								className=${paramData.style}>
								${paramData.text}
							</span>
						');
					}
					else 
					{
						jsx('
							<$LangLabel key=${Std.string(itemKeyIndex)}
								className=${paramData.style}
								textId=${paramData.textId}
								lang=${paramData.lang} />
						');
					}
					itemKeyIndex++;
					jsxTextItems.push(jsxTextItem);
					text = textItems[1];
				}
			}
			jsxTextItem = jsx('
				<$Fragment key=${Std.string(itemKeyIndex)}>
					${text}
				</$Fragment>
			');
			jsxTextItems.push(jsxTextItem); 
			textComp = jsxTextItems;
		}
				
		if (!props.option)
		{
			return jsx('
				<span className=${"".addStyle(props)} 
					ref=${getContainer}
					name=${props.name}>
					${textComp}
					${props.hint}
					${props.children}
				</span>
			');
		}
		else
		{
			return jsx('
				<option className=${"".addStyle(props)}
					value=${props.value}>
					${textComp}
					${props.children}
				</option>
			');
		}
	}

	inline function getText(): String
	{
		var text = "";
		if (props.localItemData == null)
		{
			text = LangManager.getTextByLanguage(props.textId, state.lang, props.textHandler);
		}
		else
		{
			text = LangManager.getTextByLocaleItem(props.localItemData, state.lang);
			if (props.textHandler != null)
			{
				text = props.textHandler(text, true);
			}
		}
		return text;
	}
	
	function getContainer(elem) 
	{
		container = elem;
	}
	
	override public function shouldComponentUpdate(nextProps: LangLabelProps, nextState: LangLabelState):Bool 
	{
		return ReactUtil.shouldComponentUpdate(this, nextProps, nextState);
	}
}