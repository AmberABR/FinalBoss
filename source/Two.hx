package;

class Two extends LogoControls
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		loadGraphic("assets/images/2.png", true, 24, 27);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
