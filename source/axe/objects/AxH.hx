// A set of usefull libs I use in alot of my games!
package axe.objects;

import flash.filters.BitmapFilter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxFilterFrames;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Timer;
#if sys
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
#end

class AxH
{
	static inline var SIZE_INCREASE:Int = 50;

	public static function wait(milliseconds:Int, callback:Void->Void)
	{
		Timer.delay(callback, milliseconds);
	}

	public static function cloneRepository(repositoryUrl:String, destination:String)
	{
		var gitCommand = "git clone " + repositoryUrl + " " + destination;

		#if sys
		var result = Sys.command(gitCommand);
		trace(result);
		#end
	}

	public static function createFilterFrames(sprite:FlxSprite, filter:BitmapFilter)
	{
		var filterFrames = FlxFilterFrames.fromFrames(sprite.frames, SIZE_INCREASE, SIZE_INCREASE, [filter]);
		updateFilter(sprite, filterFrames);
		return filterFrames;
	}

	public static function updateFilter(spr:FlxSprite, sprFilter:FlxFilterFrames)
	{
		// Reset the offset, it will ballon with each apply call
		spr.offset.set();
		sprFilter.applyToSprite(spr, false, true);
	}

	public static function changeColorOfButtonWhenHovering(flxText:FlxText, newColor:FlxColor, defaultColor:FlxColor)
	{
		if (FlxG.mouse.overlaps(flxText))
		{
			flxText.color = newColor;
		}
		else
		{
			flxText.color = defaultColor;
		}
	}
}
