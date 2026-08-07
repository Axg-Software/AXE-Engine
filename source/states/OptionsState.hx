package states;

import axe.objects.AxH;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OptionsState extends FlxState
{
	var dscText:FlxText = new FlxText(521, 640, FlxG.width, "Shop auto saves when left.");
	var optionsHeader:FlxText = new FlxText(9, 652, FlxG.width, "Options Menu");
	var eraseSaveButton2:FlxSprite = new FlxSprite(496, 675, null);

	var tempConfirmationText:FlxText = new FlxText(0, 360, FlxG.width, "Erease save data? Y / N"); // replace with a image eventually
	var confirmationVar:Bool = false;
	var eraseButtonSelectable:Bool = true;

	public var skipSplashScreen:FlxText = new FlxText(0, 0, FlxG.width, "Skip Start Screen:");
	public var skipSplashScreenDsc:FlxText = new FlxText(588, 25, FlxG.width, "Yes");

	var backToMenu2:FlxSprite = new FlxSprite(806, 652, null);

	public var skipSplashScreenDscSLC:Int;

	override function create()
	{
		super.create();

		if (FlxG.save.data.skipSplashScreen == "Yes")
		{
			skipSplashScreenDsc.text = "Yes";
			skipSplashScreenDscSLC = 0;
			FlxG.save.data.skipSplashScreen = skipSplashScreenDsc.text;
			FlxG.save.flush();
		}
		else if (FlxG.save.data.skipSplashScreen == null || FlxG.save.data.skipSplashScreen == "No")
		{
			skipSplashScreenDsc.text = "No";
			skipSplashScreenDscSLC = 1;
			FlxG.save.data.skipSplashScreen = skipSplashScreenDsc.text;
			FlxG.save.flush();
		}

		eraseSaveButton2.loadGraphic(AssetPaths.eraseSaveData__png, true, 244, 36);
		eraseSaveButton2.animation.add("nonHover", [0], 0);
		eraseSaveButton2.animation.add("hover", [1], 0);

		backToMenu2.loadGraphic(AssetPaths.backToMenu__png, true, 388, 68);
		backToMenu2.animation.add("nonHover", [0], 0);
		backToMenu2.animation.add("hover", [1], 0);

		dscText.setFormat(AssetPaths.novem_____ttf, 16, FlxColor.WHITE);
		optionsHeader.setFormat(AssetPaths.novem_____ttf, 64, FlxColor.WHITE);
		skipSplashScreen.setFormat(AssetPaths.novem_____ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		skipSplashScreenDsc.setFormat(AssetPaths.novem_____ttf, 32, FlxColor.WHITE);
		tempConfirmationText.setFormat(AssetPaths.novem_____ttf, 32, FlxColor.WHITE, FlxTextAlign.CENTER);

		add(optionsHeader);
		add(dscText);
		add(eraseSaveButton2);
		add(skipSplashScreen);
		add(skipSplashScreenDsc);
		add(backToMenu2);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (eraseButtonSelectable == true)
		{
			if (FlxG.mouse.overlaps(eraseSaveButton2))
			{
				eraseSaveButton2.animation.play("hover");
			}
			else
			{
				eraseSaveButton2.animation.play("nonHover");
			}
		}
		else if (eraseButtonSelectable == false)
		{
			eraseSaveButton2.animation.play("nonHover");
		}

		if (FlxG.mouse.overlaps(backToMenu2))
		{
			backToMenu2.animation.play("hover");
		}
		else
		{
			backToMenu2.animation.play("nonHover");
		}

		if (FlxG.mouse.overlaps(backToMenu2) && FlxG.mouse.justPressed)
		{
			applySettings(skipSplashScreenDsc.text);
			FlxG.switchState(new MenuState());
		}

		if (FlxG.mouse.overlaps(skipSplashScreenDsc) && FlxG.mouse.justPressed)
		{
			skipSplashScreenDscSLC = skipSplashScreenDscSLC + 1;
		}

		if (FlxG.mouse.overlaps(eraseSaveButton2) && FlxG.mouse.justPressed && eraseButtonSelectable == true)
		{
			confirmationVar = true;
		}

		AxH.changeColorOfButtonWhenHovering(skipSplashScreenDsc, FlxColor.RED, FlxColor.WHITE);

		switch skipSplashScreenDscSLC
		{
			case 0:
				skipSplashScreenDsc.text = "Yes";
			case 1:
				skipSplashScreenDsc.text = "No";
		}

		if (skipSplashScreenDscSLC > 1)
		{
			skipSplashScreenDscSLC = 0;
		}

		if (confirmationVar == true)
		{
			add(tempConfirmationText);
			eraseButtonSelectable = false;

			if (FlxG.keys.justPressed.Y)
			{
				eraseButtonSelectable = true;
				FlxG.save.erase();
				FlxG.switchState(new MenuState());
			}
			else if (FlxG.keys.justPressed.N)
			{
				confirmationVar = false;
				eraseButtonSelectable = true;
			}
		}
		else if (confirmationVar == false)
		{
			remove(tempConfirmationText);
		}
	}

	public static function applySettings(example:String)
	{
		FlxG.save.data.skipSplashScreen = example;
		FlxG.save.flush();
	}
}
