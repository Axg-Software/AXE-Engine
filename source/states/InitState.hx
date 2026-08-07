package states;

import flixel.FlxG;
import flixel.FlxState;
import states.MenuState;
import states.SplashScreenState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		if (FlxG.save.data.skipSplashScreen == "Yes")
		{
			FlxG.switchState(new MenuState());
		}
		else if (FlxG.save.data.skipSplashScreen == null || FlxG.save.data.skipSplashScreen == "No")
		{
			FlxG.switchState(new SplashScreenState());
		}
	}
}
