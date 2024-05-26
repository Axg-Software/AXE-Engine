// You can remove the watermark in your game if you want
package objects;

import flixel.text.FlxText;

class WaterMark extends FlxText
{
	public function new()
	{
		super();
		this.width = 32;
		this.size = 16;
		this.text = "AXE Engine V1.2";
		this.y = 681;
	}
}
