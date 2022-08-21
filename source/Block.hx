package;

import flixel.FlxSprite;

class Block extends FlxSprite
{
	var spd:Float = 80;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		antialiasing = true;
		loadGraphic("assets/images/block.png", true, 20, 27);
		animation.add("block", [0, 1, 2], 5, true);
		animation.play("block");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
