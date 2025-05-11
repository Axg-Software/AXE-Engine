package states;

import axe.objects.handlers.TiledLevel;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import states.substates.PauseSubState;

class PlayState extends FlxState
{
	// NOTE: If you wanna remove some of these vars you have to edit TiledLevel.hx!
	public var level:TiledLevel;

	public var player:FlxSprite;

	var customEnemy:FlxSprite;

	public var exit:FlxSprite;

	public var score:FlxText;
	public var status:FlxText;

	public var coins:FlxGroup;
	public var floor:FlxObject;

	override public function create()
	{
		super.create();
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
