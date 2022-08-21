package;

class Three extends LogoControls
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		loadGraphic("assets/images/3.png", true, 22, 27);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
