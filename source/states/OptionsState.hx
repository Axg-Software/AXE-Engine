package states;

import axe.objects.AxH;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

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
			add(restartGame);
			AxH.wait(2000, removeRestart);
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
		#if sys
		var dir = 'assets\\data\\optionsData.axh';
		File.write(dir, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(example);

		var output;

		for (i in options)
		{
			output = File.append(dir, false);
			output.writeString(i + "\n");
			output.close();
		}

		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);

			if (fileContents.indexOf("Color 1") != -1 || fileContents.indexOf("Color 2") != -1 || fileContents.indexOf("Color 3") != -1)
			{
				trace("The file contains 'Example'.");
			}
			else
			{
				trace("The file does not contain 'Example'.");
			}
		}
		else
		{
			trace("File does not exist.");
		}
		#end
	}

	function removeRestart()
	{
		remove(restartGame);
	}
}
