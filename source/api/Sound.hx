package api;

import flixel.FlxG;

class Sound
{
	public static function init()
	{
		GetLua.enter.addcallback("playSound", function(sound:String, ?loud:Float = 0.4, ?looped:Bool = false)
		{
			FlxG.sound.play(Paths.sounds(sound), loud, looped);
			return;
		});
	}
}
