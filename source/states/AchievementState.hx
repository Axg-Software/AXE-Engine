package states;

import flixel.FlxState;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class AchievementState extends FlxState
{
	var achievement1:String;
	var achievement2:String;
	var achievement3:String;
	var achievement4:String;
	var achievement5:String;

	override function create()
	{
		super.create();

		achievement1 = "assets/images/axe/discordicon.png"; // Replace the paths with the paths of your achievements images
		achievement2 = "assets/images/axe/discordicon.png";
		achievement3 = "assets/images/axe/discordicon.png";
		achievement4 = "assets/images/axe/discordicon.png";
		achievement5 = "assets/images/axe/discordicon.png";
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		achievementPaths(achievement1, achievement2, achievement3, achievement4, achievement5);
	}

	// Backend shit
	function achievementPaths(imageOnePath:String, imageTwoPath:String, imageThreePath:String, imageFourPath:String, imageFivePath:String,)
	{
		#if sys
		// --------------------ACHIEVEMENT1----------------
		var dir1 = 'assets\\data\\achievement1.axh';
		File.write(dir1, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(imageOnePath);

		var output;

		for (i in options)
		{
			output = File.append(dir1, false);
			output.writeString(i + "\n");
			output.close();
		}

		// --------------------ACHIEVEMENT2----------------
		var dir2 = 'assets\\data\\achievement1.axh';
		File.write(dir2, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(imageOnePath);

		var output;

		for (i in options)
		{
			output = File.append(dir2, false);
			output.writeString(i + "\n");
			output.close();
		}

		// --------------------ACHIEVEMENT3----------------
		var dir3 = 'assets\\data\\achievement1.axh';
		File.write(dir3, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(imageOnePath);

		var output;

		for (i in options)
		{
			output = File.append(dir3, false);
			output.writeString(i + "\n");
			output.close();
		}

		// --------------------ACHIEVEMENT4----------------
		var dir4 = 'assets\\data\\achievement1.axh';
		File.write(dir4, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(imageOnePath);

		var output;

		for (i in options)
		{
			output = File.append(dir4, false);
			output.writeString(i + "\n");
			output.close();
		}

		// --------------------ACHIEVEMENT5----------------
		var dir5 = 'assets\\data\\achievement1.axh';
		File.write(dir5, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(imageOnePath);

		var output;

		for (i in options)
		{
			output = File.append(dir5, false);
			output.writeString(i + "\n");
			output.close();
		}
		#end
	}
}
