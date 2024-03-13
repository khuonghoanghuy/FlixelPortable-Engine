package api;

import flixel.FlxCamera;

class Camera
{
	public static function init()
	{
		trace("camera init!");

		GetLua.enter.addcallback("addCamera", function(tag:String)
		{
			tag.replace('.', '');
			var cam = new FlxCamera();
			PlayState.cameraa.set(tag, cam);
			cam.active = true;
		});
	}
}
