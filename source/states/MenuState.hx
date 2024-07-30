package states;

import axe.objects.AxH;
import axe.objects.WaterMark;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.system.System;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class MenuState extends FlxState
{
	var menuText:FlxText = new FlxText(0, 0, FlxG.width, "[GAME TITLE HERE]", 0);
	var startButton:FlxText = new FlxText(0, 128, FlxG.width, "New Game", 0);
	var creditsButton:FlxText = new FlxText(0, 192, FlxG.width, "Credits", 0);
	var optionsButton:FlxText = new FlxText(0, 256, FlxG.width, "Options", 0);
	var exitButton:FlxText = new FlxText(0, 320, FlxG.width, "Exit");
	var waterMark:FlxText;
	var axh:FlxBasic;

	override function create()
	{
		super.create();

		waterMark = new WaterMark();

		menuText.setFormat(null, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		startButton.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		creditsButton.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		optionsButton.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		exitButton.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);

		add(menuText);
		add(startButton);
		add(creditsButton);
		add(optionsButton);
		add(exitButton);
		add(waterMark);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(startButton) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new PlayState());
		}
		else if (FlxG.mouse.overlaps(creditsButton) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new CreditState());
		}
		else if (FlxG.mouse.overlaps(optionsButton) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new OptionsState());
		}
		else if (FlxG.mouse.overlaps(exitButton) && FlxG.mouse.justPressed)
		{
			System.exit(69);
		}

		if (FlxG.keys.justPressed.THREE)
		{
			FlxG.switchState(new Test3dState());
		}

		AxH.changeColorOfButtonWhenHovering(startButton, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(creditsButton, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(optionsButton, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(exitButton, FlxColor.RED, FlxColor.WHITE);

		#if sys // EXAMPLE FOR SAVE DATA!!
		var dir = 'assets\\data\\optionsData.axh';

		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);

			if (fileContents.indexOf("Color 1") != -1)
			{
				settings(FlxColor.RED);
			}
			else if (fileContents.indexOf("Color 2") != -1)
			{
				settings(FlxColor.BLUE);
			}
			else if (fileContents.indexOf("Color 3") != -1)
			{
				settings(FlxColor.GREEN);
			}
			else
			{
				settings(FlxColor.WHITE);
			}
		}
		else
		{
			trace("File does not exist.");
		}
		#end
	}

	function settings(color:FlxColor)
	{
		menuText.color = color;
	}
}
