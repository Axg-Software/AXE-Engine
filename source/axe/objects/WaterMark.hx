// You can remove the watermark in your game if you want
package axe.objects;

import flixel.text.FlxText;

class WaterMark extends FlxText
{
	public function new()
	{
		super();
		this.width = 32;
		this.size = 16;
		this.text = "AXE Engine V1.5";
		this.y = 681;
	}
}
