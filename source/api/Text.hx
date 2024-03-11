package api;

import flixel.text.FlxText.FlxTextAlign;
import game.TextGame;

class Text
{
	public static function init()
	{
		GetLua.enter.addcallback("makeText", function(tag:String, x:Float = 0, y:Float = 0, fliedWidth:Float = 0, text:String = "", size:Int = 8)
		{
			tag.replace('.', '');
			var text:TextGame = new TextGame(x, y, fliedWidth, text, size);
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
				return;
			}
		});
		GetLua.enter.addcallback("sizeText", function(tag:String, size:Int = 8)
		{
			if (PlayState.textss.exists(tag))
			{
				PlayState.textss.get(tag).size = size;
				return;
			}
		});
		GetLua.enter.addcallback("alignmentText", function(tag:String, alignment:String = "LEFT")
		{
			if (PlayState.textss.exists(tag))
			{
				var aliText:FlxTextAlign;

				switch (alignment.toLowerCase())
				{
					case "left":
						aliText = LEFT;
					case "right":
						aliText = RIGHT;
					case "center":
						aliText = CENTER;
				}

				PlayState.textss.get(tag).alignment = aliText;
				return;
			}
		});
		GetLua.enter.addcallback("colorText", function(tag:String, color:Int)
		{
			if (PlayState.textss.exists(tag))
			{
				PlayState.textss.get(tag).color = color;
				return;
			}
		});
		GetLua.enter.addcallback("addText", function(tag:String)
		{
			if (PlayState.textss.exists(tag))
			{
				var text:TextGame = PlayState.textss.get(tag);
				if (text.wasAdded == false)
				{
					PlayState.init.add(text);
					text.wasAdded = true;
				}
			}
		});
		GetLua.enter.addcallback("removeText", function(tag:String)
		{
			if (PlayState.textss.exists(tag) == false)
			{
				return;
			}
			var text:TextGame = PlayState.textss.get(tag);
			if (text.wasAdded)
			{
				PlayState.init.remove(text);
				text.wasAdded = false;
			}
		});
	}
}
