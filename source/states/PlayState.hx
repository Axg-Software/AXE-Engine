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
	var customEnemy:FlxSprite;

	override public function create()
	{
		super.create();
		#if sys
		var dir = 'assets\\data\\playerData.axh';
		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);
			if (fileContents.indexOf("XP X64") != -1
				|| fileContents.indexOf("XP X128") != -1
				|| fileContents.indexOf("XP X32") != -1
				|| fileContents.indexOf("XP X16") != -1
				|| fileContents.indexOf("XP X8") != -1)
			{
				customPlayer = new Player();
				add(customPlayer);
			}
		}

		var dir2 = 'assets\\data\\enemyData.axh';
		if (FileSystem.exists(dir2))
		{
			var fileContents = File.getContent(dir2);
			if (fileContents.indexOf("XE X64") != -1
				|| fileContents.indexOf("XE X128") != -1
				|| fileContents.indexOf("XE X32") != -1
				|| fileContents.indexOf("XE X16") != -1
				|| fileContents.indexOf("XE X8") != -1)
			{
				customEnemy = new Enemy();
				add(customEnemy);
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
