package lib.ds;

abstract DatasetId(String) from String
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