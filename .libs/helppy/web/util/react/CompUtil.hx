package helppy.web.util.react;

import react.ReactMacro.jsx;

class CompUtil 
{
	public static function factory(CompClass: Dynamic, ?props: Dynamic)
	{
		var isFuncComp =  Reflect.hasField(CompClass, "render");
		var hasProps = props != null;
		
		switch ([isFuncComp, hasProps]) 
		{
			case [true, true]:
			{
				return jsx('<$CompClass.render {...props} />'); 
			}
			case [true, false]:
			{
				return jsx('<$CompClass.render />'); 
			}
			case [false, true]:
			{
				return jsx('<$CompClass {...props} />'); 
			}
			case [false, false]:
			{
				return jsx('<$CompClass />'); 
			}
		}
	}
}