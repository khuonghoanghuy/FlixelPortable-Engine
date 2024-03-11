package;

import api.Haxe;
import api.Save;
import api.Sound;
import api.Sprite;
import api.Text;
import api.Video;
import llua.Lua;
import llua.LuaL;
import llua.State;

using StringTools;

class LuaCode
{
	public static var continueVar = 1;
	public static var stopVar = 0;
	public static var lua:State = null;

	public function new(script:String)
	{
		lua = LuaL.newstate();
		LuaL.openlibs(lua);
		Lua.init_callbacks(lua);

		var result:Dynamic = LuaL.dofile(lua, script);
		var resultStr:String = Lua.tostring(lua, result);
		if (resultStr != null && result != 0)
		{
			lime.app.Application.current.window.alert(resultStr, 'Hell nah, you got Error!1!!1!!1! ;0;');
			trace('Error on .LUA script! ' + resultStr);
			lua = null;
			return;
		}
		trace('load successfully script: ' + script);
		init(); // will load amount of code lua here!
	}

	function init()
	{
		Sprite.init();
		Text.init();
		Save.init();
		Haxe.init();
		Sound.init();
		Video.init();
	}

	public function call(event:String, args:Array<Dynamic>):Dynamic
	{
		return GetLua.enter.call(event, args);
	}

	public function addVar(vari:String, dt:Dynamic)
	{
		return GetLua.enter.addVar(vari, dt);
	}

	function checkError(string:String, int:Int)
	{
		if (string != null && int != 0)
		{
			lime.app.Application.current.window.alert(string, "Error LUA Code!");
			lua = null;
			return;
		}
	}
}
