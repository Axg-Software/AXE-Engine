package states;

import axe.objects.handlers.DiscordHandler;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class SplashScreenState extends FlxState
{
	// Background vars
	var skyline:FlxBackdrop;

	// Other Vars
	var axgLogo:FlxSprite = new FlxSprite(530, 270, AssetPaths.axgicon__png);

	var introText:FlxText = new FlxText(0, 300, FlxG.width, "AXG Software", 64);
	var sToSkip:FlxText = new FlxText(0, 0, FlxG.width, "S to skip", 16);

	override function create() // make the aplha fade instead of it going to black
	{
		super.create();

		FlxG.mouse.visible = false;

		DiscordHandler.init();

		introText.setFormat(AssetPaths.novem_____ttf, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		remove(introText);
		add(axgLogo);

		sToSkip.setFormat(AssetPaths.novem_____ttf, 16, FlxColor.WHITE, FlxTextAlign.RIGHT);
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
		remove(axgLogo);
		add(introText);
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete2, false);
	}

	function onComplete2()
	{
		introText.text = "AXE Engine"; // maybe change this with a flashing neon sign like in the shop
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete3, false);
	}

	function onComplete3()
	{
		FlxG.switchState(new MenuState());
	}
}
