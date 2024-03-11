package api;

import flixel.FlxG;

class Sound
{
	public static function init()
	{
		GetLua.enter.addVar("toggleMuted", FlxG.sound.toggleMuted);
		GetLua.enter.addVar("soundTrayEnabled", FlxG.sound.soundTrayEnabled);

		GetLua.enter.addcallback("playSound", function(sound:String, ?loud:Float = 0.4, ?looped:Bool = false)
		{
			FlxG.sound.cache(Paths.sounds(sound));
			FlxG.sound.play(Paths.sounds(sound), loud, looped);
			return;
		});

		GetLua.enter.addcallback("playMusic", function(sound:String, ?loud:Float = 0.4, ?looped:Bool = false)
		{
			FlxG.sound.cache(Paths.music(sound));
			FlxG.sound.playMusic(Paths.music(sound), loud, looped);
			return;
		});
	}
}
