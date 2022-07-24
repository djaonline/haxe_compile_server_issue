package lib.ds;

abstract FieldId(String) to String
{
	inline public function new(id: String) 
	{
		this = id;
	}

	public function toString(): String 
	{
		return this;	
	}
}