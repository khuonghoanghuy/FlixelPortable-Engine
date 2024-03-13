package api;

import game.ButtonGame;

class Button
{
	public static function init()
	{
		trace("button init!");

		GetLua.enter.addcallback("makeButton", function(tag:String, x:Float = 0, y:Float = 0, ?text:String = "Sample")
		{
			tag.replace('.', '');
			var button = new ButtonGame(x, y, text);
			PlayState.buttonn.set(tag, button);
			button.active = true;
		});
		GetLua.enter.addcallback("setCamButton", function(tag:String, camAlive:String)
		{
			if (PlayState.buttonn.exists(tag))
			{
				var button:ButtonGame = PlayState.buttonn.get(tag);
				button.cameras = [PlayState.cameraa.get(camAlive)];
			}
		});
		GetLua.enter.addcallback("setButtonText", function(tag:String, text:String = "Sample")
		{
			if (PlayState.buttonn.exists(tag))
			{
				PlayState.buttonn.get(tag).text = text;
				return;
			}
		});
		GetLua.enter.addcallback("addButton", function(tag:String)
		{
			if (PlayState.buttonn.exists(tag))
			{
				var button:ButtonGame = PlayState.buttonn.get(tag);
				if (button.wasAdded == false)
				{
					PlayState.init.add(button);
					button.wasAdded = true;
				}
			}
		});
		GetLua.enter.addcallback("removeButton", function(tag:String)
		{
			if (PlayState.buttonn.exists(tag) == false)
			{
				return;
			}
			var button:ButtonGame = PlayState.buttonn.get(tag);
			if (button.wasAdded)
			{
				PlayState.init.remove(button);
				button.wasAdded = false;
			}
		});
	}
}
