package api;

import flixel.FlxG;
import game.SpriteGame;
import game.TextGame;
import hscript.Interp;
import hscript.Parser;

class Haxe
{
	static var interp:Interp;
	static var parser:Parser;

	public static function init()
	{
		// @:privateAccess
		interp = new Interp();
		parser = new Parser();

		interp.variables.set("Game", PlayState.init);
		interp.variables.set("Paths", Paths);
		interp.variables.set("FlxG", FlxG);
		interp.variables.set("SpriteGame", SpriteGame);
		interp.variables.set("TextGame", TextGame);

		GetLua.enter.addcallback("initHaxeCode", function(code:String)
		{
			interp.execute(parser.parseString(code));
		});
	}
}
