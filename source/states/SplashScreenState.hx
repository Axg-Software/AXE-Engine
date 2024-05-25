package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import objects.handlers.DiscordHandler;

class SplashScreenState extends FlxState
{
	var introText:FlxText = new FlxText(0, 300, FlxG.width, "[STUDIO NAME HERE]", 64);
	var sToSkip:FlxText = new FlxText(0, 0, FlxG.width, "S to skip", 16);

	override function create()
	{
		super.create();

		DiscordHandler.init();

		introText.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		add(introText);

		sToSkip.setFormat(null, 16, FlxColor.WHITE, FlxTextAlign.RIGHT);
		add(sToSkip);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete, false);

		if (FlxG.keys.justPressed.S)
		{
			FlxG.switchState(new MenuState());
		}
	}

	function onComplete()
	{
		introText.text = "Introduces";
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete2, false);
	}

	function onComplete2()
	{
		introText.text = "[GAME TITLE HERE]";
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete3, false);
	}

	function onComplete3()
	{
		FlxG.switchState(new MenuState());
	}
}
