package;

class Cool extends LogoControls
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		loadGraphic("assets/images/COOL.png", true, 50, 33);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
