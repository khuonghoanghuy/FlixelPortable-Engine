package api;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Tween
{
	public static function init()
	{
		trace("tweens init!");

		GetLua.enter.addcallback("cancelTween", getCancelTween);
		GetLua.enter.addcallback("tweenX", function(tag:String, vars:String, value:Dynamic, duration:Float, ease:String)
		{
			var tweenthingie:Dynamic = getTweenThingie(tag, vars);
			if (tweenthingie != null)
			{
				PlayState.tweenss.set(tag, FlxTween.tween(tweenthingie, {x: value}, duration, {
					ease: getFlxEaseByString(ease),
					onComplete: function(twn:FlxTween)
					{
						PlayState.init.callOnLuas('tweenCompleted', [tag]);
						PlayState.tweenss.remove(tag);
					}
				}));
			}
		});

		GetLua.enter.addcallback("tweenY", function(tag:String, vars:String, value:Dynamic, duration:Float, ease:String)
		{
			var tweenthingie:Dynamic = getTweenThingie(tag, vars);
			if (tweenthingie != null)
			{
				PlayState.tweenss.set(tag, FlxTween.tween(tweenthingie, {y: value}, duration, {
					ease: getFlxEaseByString(ease),
					onComplete: function(twn:FlxTween)
					{
						PlayState.init.callOnLuas('tweenCompleted', [tag]);
						PlayState.tweenss.remove(tag);
					}
				}));
			}
		});
	}

	static function getCancelTween(tag:String)
	{
		if (PlayState.tweenss.exists(tag))
		{
			PlayState.tweenss.get(tag).cancel();
			PlayState.tweenss.get(tag).destroy();
			PlayState.tweenss.remove(tag);
		}
	}

	static function getTweenThingie(tag:String, varia:String)
	{
		getCancelTween(tag);
		var variable:Array<String> = varia.replace(' ', '').split('.');
		var proppls:Dynamic = Reflect.getProperty(PlayState.init, variable[0]);
		if (proppls == null && PlayState.spritess.exists(variable[0]))
		{
			proppls = PlayState.spritess.get(variable[0]);
		}
		for (i in 1...variable.length)
		{
			proppls = Reflect.getProperty(proppls, variable[i]);
		}
		return proppls;
	}

	// from psych engine btw
	static function getFlxEaseByString(?ease:String = '')
	{
		switch (ease.toLowerCase().trim())
		{
			case 'backin':
				return FlxEase.backIn;
			case 'backinout':
				return FlxEase.backInOut;
			case 'backout':
				return FlxEase.backOut;
			case 'bouncein':
				return FlxEase.bounceIn;
			case 'bounceinout':
				return FlxEase.bounceInOut;
			case 'bounceout':
				return FlxEase.bounceOut;
			case 'circin':
				return FlxEase.circIn;
			case 'circinout':
				return FlxEase.circInOut;
			case 'circout':
				return FlxEase.circOut;
			case 'cubein':
				return FlxEase.cubeIn;
			case 'cubeinout':
				return FlxEase.cubeInOut;
			case 'cubeout':
				return FlxEase.cubeOut;
			case 'elasticin':
				return FlxEase.elasticIn;
			case 'elasticinout':
				return FlxEase.elasticInOut;
			case 'elasticout':
				return FlxEase.elasticOut;
			case 'expoin':
				return FlxEase.expoIn;
			case 'expoinout':
				return FlxEase.expoInOut;
			case 'expoout':
				return FlxEase.expoOut;
			case 'quadin':
				return FlxEase.quadIn;
			case 'quadinout':
				return FlxEase.quadInOut;
			case 'quadout':
				return FlxEase.quadOut;
			case 'quartin':
				return FlxEase.quartIn;
			case 'quartinout':
				return FlxEase.quartInOut;
			case 'quartout':
				return FlxEase.quartOut;
			case 'quintin':
				return FlxEase.quintIn;
			case 'quintinout':
				return FlxEase.quintInOut;
			case 'quintout':
				return FlxEase.quintOut;
			case 'sinein':
				return FlxEase.sineIn;
			case 'sineinout':
				return FlxEase.sineInOut;
			case 'sineout':
				return FlxEase.sineOut;
			case 'smoothstepin':
				return FlxEase.smoothStepIn;
			case 'smoothstepinout':
				return FlxEase.smoothStepInOut;
			case 'smoothstepout':
				return FlxEase.smoothStepInOut;
			case 'smootherstepin':
				return FlxEase.smootherStepIn;
			case 'smootherstepinout':
				return FlxEase.smootherStepInOut;
			case 'smootherstepout':
				return FlxEase.smootherStepOut;
		}
		return FlxEase.linear;
	}
}
