package;

import flixel.FlxSprite;
import flixel.math.FlxVelocity;
import flixel.util.FlxColor;

class Bullet extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		makeGraphic(4, 4, FlxColor.WHITE);
		FlxVelocity.moveTowardsMouse(this, 700);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
