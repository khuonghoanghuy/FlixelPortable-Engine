package api;

import hscript.Interp;
import hscript.Parser;

class Haxe
{
	public static function init()
	{
		var interp:Interp;
		var parser:Parser;
		@:privateAccess
		GetLua.enter.addcallback("initHaxeCode", function(code:String)
		{
			interp.execute(parser.parseString(code));
		});
	}
}
