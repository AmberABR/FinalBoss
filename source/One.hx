package;

class One extends LogoControls
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		loadGraphic("assets/images/1.png", true, 24, 27);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
