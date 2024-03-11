package;

import flixel.FlxSprite;
import flixel.text.FlxText;
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
		GetLua.enter.addcallback("makeText", function(tag:String, x:Float = 0, y:Float = 0, fliedWidth:Float = 0, text:String = "", size:Int = 8)
		{
			tag.replace('.', '');
			var text:FlxText = new FlxText(x, y, fliedWidth, text, size);
			PlayState.textss.set(tag, text);
			text.active = true;
		});
		GetLua.enter.addcallback("scaleText", function(tag:String, x:Float = 0, y:Float)
		{
			if (PlayState.textss.exists(tag))
			{
				PlayState.textss.get(tag).scale.set(x, y);
				return;
			}
		});
		GetLua.enter.addcallback("scrollFactorText", function(tag:String, x:Float = 0, y:Float = 0)
		{
			if (PlayState.textss.exists(tag))
			{
				PlayState.textss.get(tag).scrollFactor.set(x, y);
			}
		});
		GetLua.enter.addcallback("sizeText", function(tag:String, size:Int = 8)
		{
			if (PlayState.textss.exists(tag))
			{
				PlayState.textss.get(tag).size = size;
			}
		});
		GetLua.enter.addcallback("makeFlxGraphic", function(x:Float = 0, y:Float = 0, width:Int = 0, height:Int = 0, color:Int = 0)
		{
			new FlxSprite(x, y).makeGraphic(width, height, color);
		});
		GetLua.enter.addcallback("makeSprite", function(tag:String, image:String, x:Float = 0, y:Float = 0)
		{
			tag.replace('.', '');
			var sprite:SpriteGame = new SpriteGame(x, y, Paths.image(image));
			PlayState.spritess.set(tag, sprite);
			sprite.active = true;
		});
		GetLua.enter.addcallback("scaleSprite", function(tag:String, x:Float = 0, y:Float = 0)
		{
			if (PlayState.spritess.exists(tag))
			{
				PlayState.spritess.get(tag).scale.set(x, y);
				return;
			}
		});
		GetLua.enter.addcallback("scrollFactorSprite", function(tag:String, x:Float = 0, y:Float = 0)
		{
			if (PlayState.spritess.exists(tag))
			{
				PlayState.spritess.get(tag).scrollFactor.set(x, y);
				return;
			}
		});
		GetLua.enter.addcallback("addSprite", function(tag:String)
		{
			if (PlayState.spritess.exists(tag))
			{
				var sprites:SpriteGame = PlayState.spritess.get(tag);
				if (sprites.wasAdded == false)
				{
					PlayState.init.add(sprites);
					sprites.wasAdded = true;
				}
			}
		});
		GetLua.enter.addcallback("removeSprite", function(tag:String)
		{
			if (PlayState.spritess.exists(tag) == false)
			{
				return;
			}
			var sprites:SpriteGame = PlayState.spritess.get(tag);
			if (sprites.wasAdded)
			{
				PlayState.init.remove(sprites);
				sprites.wasAdded = false;
			}
		});
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
