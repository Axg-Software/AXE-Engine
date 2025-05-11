package states.substates;

import axe.objects.AxH;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.system.System;

class PauseSubState extends FlxSubState
{
	var pauseText:FlxText = new FlxText(0, 100, FlxG.width, "PAUSED", 64);
	// Difference between all of the buttons is 64
	var backText:FlxText = new FlxText(0, 228, FlxG.width, "Continue", 32);
	var optionsText:FlxText = new FlxText(0, 292, FlxG.width, "Options", 32);
	var exitText:FlxText = new FlxText(0, 356, FlxG.width, "Exit to menu", 32);

	public function new()
	{
		super(0xFF000000);
	}

	override function create()
	{
		super.create();

		pauseText.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		backText.setFormat(null, 32, FlxColor.WHITE, FlxTextAlign.CENTER);
		optionsText.setFormat(null, 32, FlxColor.WHITE, FlxTextAlign.CENTER);
		exitText.setFormat(null, 32, FlxColor.WHITE, FlxTextAlign.CENTER);
		add(pauseText);
		add(backText);
		add(optionsText);
		add(exitText);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(backText) && FlxG.mouse.justPressed)
		{
			close();
		}
		else if (FlxG.mouse.overlaps(optionsText) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new OptionsState());
		}
		else if (FlxG.mouse.overlaps(exitText) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new MenuState());
		}

		AxH.changeColorOfButtonWhenHovering(backText, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(optionsText, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(exitText, FlxColor.RED, FlxColor.WHITE);
	}
}
