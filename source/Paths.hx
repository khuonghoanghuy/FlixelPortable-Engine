package;

class Paths
{
	inline public static function file(name:String):String
	{
		return 'assets/$name';
	}

	inline public static function image(name:String):String
	{
		return file('images/$name.png');
	}

	inline public static function data(name:String):String
	{
		return file('data/$name');
	}

	inline public static function sounds(name:String):String
	{
		return file('sounds/$name');
	}

	inline public static function music(name:String):String
	{
		return file('music/$name');
	}
}
