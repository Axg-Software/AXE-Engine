package states;

import axe.objects.AxH;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OptionsState extends FlxState
{
	public var musicOption:FlxText = new FlxText(0, 0, FlxG.width, "Color of menu");
	public var musicOptionDsc:FlxText = new FlxText(0, 64, FlxG.width, "Color 1");

	var backToMenu:FlxText = new FlxText(0, 632, FlxG.width, "Back to menu", 64);
	var applyButton:FlxText = new FlxText(0, 504, FlxG.width, "Apply", 64);
	var restartGame:FlxText = new FlxText(300, 504, FlxG.width, "Restart game to see changes", 64);

	public var musicOptionDscSLC:Int = 0;

	override function create()
	{
		super.create();

		musicOption.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		musicOptionDsc.setFormat(null, 32, FlxColor.WHITE, FlxTextAlign.LEFT);
		backToMenu.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		applyButton.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		restartGame.setFormat(null, 25, FlxColor.WHITE, FlxTextAlign.CENTER);
		add(musicOption);
		add(musicOptionDsc);
		add(backToMenu);
		add(applyButton);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(backToMenu) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new MenuState());
		}

		if (FlxG.mouse.overlaps(musicOptionDsc) && FlxG.mouse.justPressed)
		{
			musicOptionDscSLC = musicOptionDscSLC + 1;
		}

		if (FlxG.mouse.overlaps(applyButton) && FlxG.mouse.justPressed)
		{
			applySettings(musicOptionDsc.text);
		}

		AxH.changeColorOfButtonWhenHovering(musicOptionDsc, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(backToMenu, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(applyButton, FlxColor.RED, FlxColor.WHITE);

		switch musicOptionDscSLC
		{
			case 0:
				musicOptionDsc.text = "Color 1";
			case 1:
				musicOptionDsc.text = "Color 2";
			case 2:
				musicOptionDsc.text = "Color 3";
		}

		if (musicOptionDscSLC > 2)
		{
			musicOptionDscSLC = 0;
		}
	}

	public static function applySettings(example:String)
	{
		FlxG.save.data.mainMenuColor = example;
		FlxG.save.flush();
	}
}
