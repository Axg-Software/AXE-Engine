// Idea: There can only be 5 achievements per game it would make it more ez to add
package axe.objects.handlers;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

class AchievementHandler
{
	function unlock(Achievement:String, AchievementNumber:Int)
	{
		#if sys
		var dir = 'assets\\data\\achievements\\achievement' + Std.string(AchievementNumber) + '.axh';
		File.write(dir, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(Achievement);

		var output;

		for (i in options)
		{
			output = File.append(dir, false);
			output.writeString(i + "\n");
			output.close();
		}
		#end
	}
}
