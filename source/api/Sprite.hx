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
			var sprite:SpriteGame = new SpriteGame(x, y);
			sprite.loadGraphic(Paths.image(image));
			PlayState.spritess.set(tag, sprite);
			sprite.active = true;
		});
		GetLua.enter.addcallback("setCamSprite", function(tag:String, camAlive:String)
		{
			if (PlayState.spritess.exists(tag))
			{
				var sprite:SpriteGame = PlayState.spritess.get(tag);
				sprite.cameras = [PlayState.cameraa.get(camAlive)];
			}
		});
		GetLua.enter.addcallback("playAnim", function(tag:String, name:String, force:Bool = false, reversed:Bool = false, frame:Int = 0)
		{
			if (PlayState.spritess.exists(tag))
			{
				PlayState.spritess.get(tag).animation.play(name, force, reversed, frame);
				return;
			}
		});
		GetLua.enter.addcallback("addPrefixAnim", function(tag:String, name:String, prefix:String, framerate:Int = 30, looped:Bool = false)
		{
			if (PlayState.spritess.exists(tag))
			{
				var sprite:SpriteGame = PlayState.spritess.get(tag);
				sprite.animation.addByPrefix(name, prefix, framerate, looped);
				if (sprite.animation.curAnim == null)
				{
					sprite.animation.play(name);
				}
				return;
			}
		});
		GetLua.enter.addcallback("addAnim", function(tag:String, name:String, array:Array<Int>, framerate:Int = 30, looped:Bool = false)
		{
			if (PlayState.spritess.exists(tag))
			{
				var sprite:SpriteGame = PlayState.spritess.get(tag);
				sprite.animation.add(name, array, framerate, looped);
				if (sprite.animation.curAnim == null)
				{
					sprite.animation.play(name);
				}
				return;
			}
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
