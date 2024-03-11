package api;

class Video
{
	public static function init()
	{
		trace("video init!");

		GetLua.enter.addcallback("playVideo", function(videoToPlay:String, shouldLoop:Bool = false)
		{
			PlayState.playVideo(videoToPlay, shouldLoop);
			return;
		});
	}
}
