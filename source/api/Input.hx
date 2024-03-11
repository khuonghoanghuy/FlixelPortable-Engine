package api;

import flixel.FlxG;

class Input
{
	public static function init()
	{
		trace("input init!");

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

		GetLua.enter.addcallback("mousePressed", function(e:String)
		{
			var buttonthingie = null;
			switch (e.toLowerCase())
			{
				case "left":
					buttonthingie = FlxG.mouse.pressed;
				case "middle":
					buttonthingie = FlxG.mouse.pressedMiddle;
				case "right":
					buttonthingie = FlxG.mouse.pressedRight;
			}
			return buttonthingie;
		});

		GetLua.enter.addcallback("mouseJustPressed", function(e:String)
		{
			var buttonthingie = null;
			switch (e.toLowerCase())
			{
				case "left":
					buttonthingie = FlxG.mouse.justPressed;
				case "middle":
					buttonthingie = FlxG.mouse.justPressedMiddle;
				case "right":
					buttonthingie = FlxG.mouse.justPressedRight;
			}
			return buttonthingie;
		});

		GetLua.enter.addcallback("mouseRelease", function(e:String)
		{
			var buttonthingie = null;
			switch (e.toLowerCase())
			{
				case "left":
					buttonthingie = FlxG.mouse.released;
				case "middle":
					buttonthingie = FlxG.mouse.releasedMiddle;
				case "right":
					buttonthingie = FlxG.mouse.releasedRight;
			}
			return buttonthingie;
		});

		GetLua.enter.addcallback("mouseJustRelease", function(e:String)
		{
			var buttonthingie = null;
			switch (e.toLowerCase())
			{
				case "left":
					buttonthingie = FlxG.mouse.justReleased;
				case "middle":
					buttonthingie = FlxG.mouse.justReleasedMiddle;
				case "right":
					buttonthingie = FlxG.mouse.justReleasedRight;
			}
			return buttonthingie;
		});
	}
}
