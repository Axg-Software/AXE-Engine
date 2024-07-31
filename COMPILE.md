# How to compile!
To comlile the engine you need to follow the steps to install [HaxeFlixel](https://haxeflixel.com) and follow the required steps

## Other libs you need to install!!
- Other things that you need to install to compile this is: `Discord RPC` which you can install by running `haxelib install hxdiscord_rpc 1.1.1` in your terminal!
- You also need to install a one more lib, `Away3D` which you can install by running `haxelib install away3d 5.0.9` in your terminal.

## How to run
Do `Lime test PLATFORM` or `Lime test PLATFORM -debug` if you want to go into debug mode.

Make sure to replace `PLATFORM` with your machine OS (Linux, Mac, Windows, etc)

If you want to compile to windows recent of [V1.5](PUTLINK!!!) you have to remove all 3d .hx files so those including:
- The entire away3d folder
- The entire flx3D folder
- The entire openfl folder
- And Flixel.hx

And next you want to remove this block of code in `MenuState.hx`

    	if (FlxG.keys.justPressed.THREE)
	{
		FlxG.switchState(new Test3dState());
	}


Now it should be up and running! if there are any problems make sure to make a issues in the issues tab in github!
