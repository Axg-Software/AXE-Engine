package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.SplashScreenState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, SplashScreenState, 60, 60, true, false));
	}
}
