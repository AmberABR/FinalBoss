package;

class MinesOne extends LogoControls
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		loadGraphic("assets/images/minesone.png", true, 32, 28);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
