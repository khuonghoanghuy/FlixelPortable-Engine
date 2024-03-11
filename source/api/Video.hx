package api;

import hxcodec.flixel.FlxVideo;

class Video
{
	static var video:FlxVideo;

	public function new()
	{
		video = new FlxVideo();
		video.onEndReached.add(video.dispose);
	}

	public static function init()
	{
		GetLua.enter.addcallback("playVideo", function(videoToPlay:String, shouldLoop:Bool = false)
		{
			video.play(Paths.video(videoToPlay), shouldLoop);
		});
	}
}
