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

	override function destroy()
	{
		super.destroy();
		flixel.destroy();
	}
}
