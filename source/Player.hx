package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;

class Player extends FlxSprite
{
	// Variables
	var spd:Float = 50;
	var mUp:Int = 1;
	var mDown:Int = 1;
	var _move:FlxSound;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		// _move = FlxG.sound.load("assets/sounds/ClickJam2.ogg");

		antialiasing = true;

		loadGraphic("assets/images/player.png", true, 31, 25);
		animation.add("idle", [0, 1, 2], 5, true);
		animation.add("shoot", [0, 3, 4], 15, false);
		animation.play("idle");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		velocity.x = 0;

		// move
		if (mUp > 0)
		{
			if (FlxG.keys.justPressed.W)
			{
				y = y - 40;
				mUp -= 1;
				mDown += 1;
				FlxG.camera.zoom += 0.2;
				// _move.play();
			}
		}
		if (mDown > 0)
		{
			if (FlxG.keys.justPressed.S)
			{
				y = y + 40;
				mUp += 1;
				mDown -= 1;
				FlxG.camera.zoom += 0.2;
				// _move.play();
			}
		}
		if (FlxG.mouse.justPressed)
		{
			// animation.play("shoot");
		}
		if (animation.finished == true)
		{
			animation.play("idle");
		}
	}
}
