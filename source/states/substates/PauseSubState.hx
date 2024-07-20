package states.substates;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PauseSubState extends FlxSubState
{
	var pauseText:FlxText = new FlxText(0, 300, FlxG.width, "PAUSED", 64);
	var backText:FlxText = new FlxText(0, 650, FlxG.width, "Back", 32);

	public function new()
	{
		super(0xFF000000);
	}

	override function create()
	{
		super.create();

		pauseText.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		backText.setFormat(null, 32, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(pauseText);
		add(backText);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(backText) && FlxG.mouse.justPressed)
		{
			close();
		}
	}
}
