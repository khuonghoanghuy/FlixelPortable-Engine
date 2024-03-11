package api;

import flixel.FlxG;
import lime.app.Application;
import openfl.display.FPS;

class System
{
	public static function init()
	{
		trace("system init!");

		GetLua.enter.addVar("version", Application.current.meta.get("version"));
		GetLua.enter.addcallback("setTitle", function(name:String)
		{
			Application.current.window.title = name;
			return;
		});
		GetLua.enter.addcallback("makeAlert", function(title:String, text:String)
		{
			Application.current.window.alert(text, title);
			return;
		});
		GetLua.enter.addcallback("createFPS", function(x:Float = 0, y:Float = 0, color:Int = 0xffffff)
		{
			return FlxG.stage.addChild(new FPS(x, y, color));
		});
		GetLua.enter.addcallback("resizeWindow", function(width:Int = 640, height:Int = 480)
		{
			FlxG.resizeWindow(width, height);
			return;
		});
		GetLua.enter.addcallback("resizeGame", function(width:Int = 640, height:Int = 480)
		{
			FlxG.resizeGame(width, height);
			return;
		});
		GetLua.enter.addcallback("drawFramerate", function(newFPS:Int = 60)
		{
			FlxG.drawFramerate = newFPS;
			return;
		});
		GetLua.enter.addcallback("updateFramerate", function(newFPS:Int = 60)
		{
			FlxG.updateFramerate = newFPS;
			return;
		});
	}
}
