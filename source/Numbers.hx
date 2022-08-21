package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;

class Numbers extends FlxSprite
{
	var sound:FlxSound;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		antialiasing = true;

		sound = FlxG.sound.load("assets/sounds/IntroPlay.ogg");
		sound.play();

		loadGraphic("assets/images/321.png", true, 82, 97);
		animation.add("123", [0, 1, 2], 0.7, false);
		animation.play("123");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
