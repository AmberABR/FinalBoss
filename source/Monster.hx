package;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class Monster extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		antialiasing = true;

		loadGraphic("assets/images/badguy.png", true, 208, 152);
		animation.add("si", [0, 1], 5, true);
		animation.play("si");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		velocity.x = 0;
		velocity.y = 0;
	}
}
