// This is completely optional you can remove axon scripting from your game if you want
package axe.objects.handlers;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class Player extends FlxSprite
{
	var widthTR:Int = 0;
	var heightTR:Int = 0;

	public function new()
	{
		super();
		#if sys
		var dir = 'assets\\data\\playerData.axh';
		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);
			if (fileContents.indexOf("XP X8") != -1)
			{
				widthTR = 8;
				heightTR = 8;
			}
			else if (fileContents.indexOf("XP X16") != -1)
			{
				widthTR = 16;
				heightTR = 16;
			}
			else if (fileContents.indexOf("XP X32") != -1)
			{
				widthTR = 32;
				heightTR = 32;
			}
			else if (fileContents.indexOf("XP X64") != -1)
			{
				widthTR = 64;
				heightTR = 64;
			}
			else if (fileContents.indexOf("XP X128") != -1)
			{
				widthTR = 128;
				heightTR = 128;
			}
		}
		#end
		this.makeGraphic(widthTR, heightTR, FlxColor.WHITE);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
		{
			this.y = this.y - 4;
		}
		if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
		{
			this.y = this.y + 4;
		}
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
		{
			this.x = this.x - 4;
		}
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
		{
			this.x = this.x + 4;
		}
	}
}

class Enemy extends FlxSprite
{
	var widthTRE:Int = 0;
	var heightTRE:Int = 0;

	public function new()
	{
		super();
		this.x = 100;
		this.y = 100;
		#if sys
		var dir = 'assets\\data\\enemyData.axh';
		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);
			if (fileContents.indexOf("XE X8") != -1)
			{
				widthTRE = 8;
				heightTRE = 8;
			}
			else if (fileContents.indexOf("XE X16") != -1)
			{
				widthTRE = 16;
				heightTRE = 16;
			}
			else if (fileContents.indexOf("XE X32") != -1)
			{
				widthTRE = 32;
				heightTRE = 32;
			}
			else if (fileContents.indexOf("XE X64") != -1)
			{
				widthTRE = 64;
				heightTRE = 64;
			}
			else if (fileContents.indexOf("XE X128") != -1)
			{
				widthTRE = 128;
				heightTRE = 128;
			}
		}
		#end
		this.makeGraphic(widthTRE, heightTRE, FlxColor.RED);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
