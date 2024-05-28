// A set of usefull libs I use in alot of my games!
package axe.objects;

import haxe.Timer;
#if sys
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
#end

class AxH
{
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
}
