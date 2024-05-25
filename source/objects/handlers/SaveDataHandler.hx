package objects.handlers;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

class SaveDataHandler
{
	public static function readSave(playerX:Int, playerY:Int, room:Int)
	{
		#if sys
		var dir = 'assets\\data\\SaveData.txt';
		File.write(dir, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(playerX, playerY, room);

		var output;

		for (i in options)
		{
			output = File.append(dir, false);
			output.writeString(i + "\n");
			output.close();
		}

		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);
		}
		else
		{
			trace("File does not exist.");
		}
		#end
	}
}
