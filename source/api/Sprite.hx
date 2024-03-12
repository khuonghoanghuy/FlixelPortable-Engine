package api;

import flixel.FlxSprite;
import game.SpriteGame;

class Sprite
{
	public static function init()
	{
		trace("sprite init!");

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
		GetLua.enter.addcallback("alphaSprite", function(tag:String, alpha:Float = 1.0)
		{
			if (PlayState.spritess.exists(tag))
			{
				PlayState.spritess.get(tag).alpha = alpha;
				return;
			}
		});
		GetLua.enter.addcallback("angleSprite", function(tag:String, angle:Float = 1.0)
		{
			if (PlayState.spritess.exists(tag))
			{
				PlayState.spritess.get(tag).angle = angle;
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
}
