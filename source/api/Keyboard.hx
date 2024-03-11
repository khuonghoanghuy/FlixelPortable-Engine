package api;

import flixel.FlxG;

class Keyboard
{
	public static function init()
	{
		GetLua.enter.addcallback("keyPressed", function(e:String)
		{
			return Reflect.getProperty(FlxG.keys.pressed, e);
		});

		GetLua.enter.addcallback("keyJustPressed", function(e:String)
		{
			return Reflect.getProperty(FlxG.keys.justPressed, e);
		});

		GetLua.enter.addcallback("keyRelease", function(e:String)
		{
			return Reflect.getProperty(FlxG.keys.released, e);
		});

		GetLua.enter.addcallback("keyJustRelease", function(e:String)
		{
			return Reflect.getProperty(FlxG.keys.justReleased, e);
		});
	}
}
