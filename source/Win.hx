package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Win extends FlxSprite
{
	var win:FlxSound;
	var select:FlxSound;
	var _timer1:FlxTimer;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		antialiasing = true;

		_timer1 = new FlxTimer();

		win = FlxG.sound.load("assets/images/Something.ogg");
		select = FlxG.sound.load("assets/images/Select.ogg");
		loadGraphic("assets/images/win.png", true, 250, 144);

		win.play();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.sound.destroy();
			select.play();
			FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
			_timer1.start(0.5, timer1);
		}
	}

	public function timer1(deltaT:FlxTimer)
	{
		FlxG.resetGame();
	}
}
