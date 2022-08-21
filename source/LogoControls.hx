package;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class LogoControls extends FlxSprite
{
	var spd:Float = 80;
	var jump:Bool = true;
	var _timer1:FlxTimer;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		var randomAngle:Float = Std.random(2) + 1;

		switch (randomAngle)
		{
			case 1:
				angle = 15;
			case 2:
				angle = -15;
		}

		antialiasing = true;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		alpha = alpha - 0.006;

		velocity.y += 1;
	}

	public function timer1(deltaT:FlxTimer)
	{
		jump = false;
	}
}
