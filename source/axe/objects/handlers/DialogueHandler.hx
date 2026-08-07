package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class DialogueHandler extends FlxGroup
{
	public var box:FlxSprite;
	public var text:FlxText;
	public var lines:Array<String>;
	public var currentLine:Int = 0;
	public var fullText:String = "";
	public var displayedText:String = "";
	public var textSpeed:Float = 0.02;
	public var timer:Float = 0;
	public var isActive:Bool = false;
	public var done:Bool = false;

	public function new()
	{
		super();

		var boxWidth:Int = 1000;
		var boxHeight:Int = 100;
		var boxX:Float = (FlxG.width - boxWidth) / 2;
		var boxY:Float = FlxG.height - boxHeight - 40;

		// Background box
		box = new FlxSprite(boxX, boxY);
		box.makeGraphic(boxWidth, boxHeight, FlxColor.BLACK);
		box.alpha = 0.85;
		add(box);

		// Text display
		text = new FlxText(boxX + 24, boxY + 20, boxWidth - 48, "");
		text.setFormat(null, 18, FlxColor.WHITE, "center"); // Larger font, centered
		add(text);
	}

	public function startDialogue(dialogueLines:Array<String>)
	{
		lines = dialogueLines;
		currentLine = 0;
		displayedText = "";
		fullText = lines[currentLine];
		timer = 0;
		isActive = true;
		done = false;
		visible = true;
		text.text = "";
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (!isActive || done)
			return;

		if (displayedText.length < fullText.length)
		{
			timer += elapsed;
			if (timer >= textSpeed)
			{
				displayedText += fullText.charAt(displayedText.length);
				text.text = displayedText;
				timer = 0;
			}
		}
		else
		{
			if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER)
			{
				currentLine++;
				if (currentLine >= lines.length)
				{
					isActive = false;
					done = true;
					visible = false;
				}
				else
				{
					fullText = lines[currentLine];
					displayedText = "";
					text.text = "";
				}
			}
		}
	}
}
