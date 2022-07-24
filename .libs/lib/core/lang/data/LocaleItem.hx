package lib.core.lang.data;

abstract LocaleItem(LocaleItemData) from LocaleItemData
{
	inline public function new(item: LocaleItemData) 
	{
		this = item;
	}

	public function getValueByLang(lang: Language): String
	{
		return switch lang
		{
			case Language.EN:
			{
				this.en;
			}
			default: "";
		}
	}
}