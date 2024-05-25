// A set of usefull libs I use in alot of my games!
package objects;

import flixel.FlxBasic;
import haxe.Timer;
#if sys
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
#end

class AxH extends FlxBasic
{
	public static function wait(milliseconds:Int, callback:Void->Void):Void
	{
		Timer.delay(callback, milliseconds);
	}

	public static function cloneRepository(repositoryUrl:String, destination:String):Void
	{
		var gitCommand = "git clone " + repositoryUrl + " " + destination;

		#if sys
		var result = Sys.command(gitCommand);
		trace(result);
		#end
	}
}
