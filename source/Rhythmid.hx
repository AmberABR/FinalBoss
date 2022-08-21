package;

import flixel.FlxSprite;

class Rhythmid extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		antialiasing = true;
		loadGraphic("assets/images/rhythmidThread.png", true, 301, 86);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
