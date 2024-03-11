package;

import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import game.*;
import sys.FileSystem;

using StringTools;

class PlayState extends FlxState
{
	public static var luaArray:Array<LuaCode> = [];

	public static var spritess:Map<String, SpriteGame> = new Map<String, SpriteGame>();
	public static var textss:Map<String, TextGame> = new Map<String, TextGame>();
	public static var tweenss:Map<String, FlxTween> = new Map<String, FlxTween>();
	public static var soundss:Map<String, FlxSound> = new Map<String, FlxSound>();
	public static var musicc:Map<String, FlxSound> = new Map<String, FlxSound>();

	public static var init:PlayState = null;

	// took from psych engine ;-;
	public function callOnLuas(event:String, args:Array<Dynamic>):Dynamic
	{
		var returnVal:Dynamic = LuaCode.continueVar;
		for (i in 0...luaArray.length)
		{
			var ret:Dynamic = luaArray[i].call(event, args);
			if (ret != LuaCode.continueVar)
			{
				returnVal = ret;
			}
		}
		return returnVal;
	}

	// took from psych engine ;-;
	public function setOnLuas(variable:String, arg:Dynamic)
	{
		for (i in 0...luaArray.length)
		{
			luaArray[i].addVar(variable, arg);
		}
	}

	override public function create()
	{
		init = this;

		var filesPushed:Array<String> = [];
		var foldersToCheck:Array<String> = [Paths.data('')];

		for (folder in foldersToCheck)
		{
			if (FileSystem.exists(folder))
			{
				for (file in FileSystem.readDirectory(folder))
				{
					trace("load file: " + file + " at " + folder);

					if (file.endsWith('.lua') && !filesPushed.contains(file))
					{
						luaArray.push(new LuaCode(folder + file));
						filesPushed.push(file);
					}
				}
			}
		}

		super.create();
		callOnLuas("create", []);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		callOnLuas("update", [elapsed]);
	}
}
