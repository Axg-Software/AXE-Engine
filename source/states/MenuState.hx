package states;

import axe.objects.AxH;
import axe.objects.WaterMark;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.system.System;

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
		FlxG.mouse.visible = true;

		waterMark = new WaterMark();

		menuText.setFormat(AssetPaths.novem_____ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		startButton.setFormat(AssetPaths.novem_____ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		creditsButton.setFormat(AssetPaths.novem_____ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		optionsButton.setFormat(AssetPaths.novem_____ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		exitButton.setFormat(AssetPaths.novem_____ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);

		add(menuText);
		add(startButton);
		add(creditsButton);
		add(optionsButton);
		add(exitButton);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.V)
		{
			add(waterMark);
		}
		else
		{
			remove(waterMark);
		}

		if (FlxG.keys.pressed.E && FlxG.keys.pressed.D) // DELETE SOON
		{
			FlxG.save.erase();
			FlxG.save.flush();
			System.exit(69);
		}

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

		AxH.changeColorOfButtonWhenHovering(startButton, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(creditsButton, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(optionsButton, FlxColor.RED, FlxColor.WHITE);
		AxH.changeColorOfButtonWhenHovering(exitButton, FlxColor.RED, FlxColor.WHITE);
	}
}
