package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class CreditState extends FlxState
{
	var backToMenu:FlxText = new FlxText(0, 632, FlxG.width, "Back to menu", 64);
	var credits:FlxText = new FlxText(0, 0, FlxG.width, "Deep_Fried_Bread: Everything", 26);

	override public function create()
	{
		super.create();

		credits.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		backToMenu.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.LEFT);

		add(backToMenu);
		add(credits);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(backToMenu) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new MenuState());
		}
	}
}
