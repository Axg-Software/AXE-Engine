package states;

import flixel.FlxG;
import flixel.FlxState;

class Test3dState extends FlxState
{
	var flixel:Flixel;

	override public function create()
	{
		super.create();

		flixel = new Flixel();
		add(flixel);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.BACKSPACE)
		{
			FlxG.switchState(new MenuState());
		}
	}

	override function destroy()
	{
		super.destroy();
		flixel.destroy();
	}
}
