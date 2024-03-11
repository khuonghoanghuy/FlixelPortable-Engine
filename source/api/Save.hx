package api;

import flixel.FlxG;

class Save
{
	public static function init()
	{
		trace("save init!");

		GetLua.enter.addcallback("createBind", function(name:String, ?path:String = "template")
		{
			FlxG.save.bind(name, path);
			return;
		});
	}
}
