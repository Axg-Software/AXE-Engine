package states;

import axe.objects.handlers.AxhHandler;
import flixel.FlxG;
import flixel.FlxState;
import states.substates.PauseSubState;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.P)
		{
			openSubState(new PauseSubState());
		}
	}
}
