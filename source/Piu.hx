package;

class Piu extends LogoControls
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		loadGraphic("assets/images/piu.png", true, 38, 29);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
