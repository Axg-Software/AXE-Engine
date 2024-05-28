package states;

import axe.objects.handlers.AxhHandler;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class PlayState extends FlxState
{
	var customPlayer:FlxSprite;

	override public function create()
	{
		super.create();
		#if sys
		var dir = 'assets\\data\\playerData.axh';
		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);
			if (fileContents.indexOf("XPX64") != -1
				|| fileContents.indexOf("XPX128") != -1
				|| fileContents.indexOf("XPX32") != -1
				|| fileContents.indexOf("XPX16") != -1
				|| fileContents.indexOf("XPX8") != -1)
			{
				customPlayer = new Player();
				add(customPlayer);
			}
		}
		#end
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
