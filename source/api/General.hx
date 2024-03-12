package api;

class General
{
	public static function init():Void
	{
		trace("general init!");

		// fully copy from fnf psych engine
		GetLua.enter.addcallback("getProperty", function(variables:String)
		{
			var killMe:Array<String> = variables.split('.');
			if (killMe.length > 1)
			{
				var coverMeInPiss:Dynamic = null;
				if (PlayState.spritess.exists(killMe[0]))
				{
					coverMeInPiss = PlayState.spritess.get(killMe[0]);
				}
				else if (PlayState.textss.exists(killMe[0]))
				{
					coverMeInPiss = PlayState.textss.get(killMe[0]);
				}
				else
				{
					coverMeInPiss = Reflect.getProperty(PlayState.init, killMe[0]);
				}

				for (i in 1...killMe.length - 1)
				{
					coverMeInPiss = Reflect.getProperty(coverMeInPiss, killMe[i]);
				}
				return Reflect.getProperty(coverMeInPiss, killMe[killMe.length - 1]);
			}
			return Reflect.getProperty(PlayState.init, variables);
		});

		GetLua.enter.addcallback("setProperty", function(variables:String, value:Dynamic)
		{
			var arg:Array<String> = variables.split('.');
			if (variables.length > 1)
			{
				var dynathing:Dynamic;
				if (PlayState.spritess.exists(arg[0]))
				{
					dynathing = PlayState.spritess.get(arg[0]);
				}
				else if (PlayState.textss.exists(arg[0]))
				{
					dynathing = PlayState.textss.get(arg[0]);
				}
				else
				{
					Reflect.getProperty(PlayState.init, variables);
					return;
				}

				for (i in 1...arg.length - 1)
				{
					dynathing = Reflect.getProperty(dynathing, arg[i]);
				}
				return Reflect.setProperty(dynathing, arg[arg.length - 1], value);
			}
			return Reflect.setProperty(PlayState.init, variables, value);
		});
	}
}
