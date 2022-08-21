package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	var _player:Player;
	var _badguy:Monster;
	var obafguy:FlxTypedGroup<Monster>;
	var _bullet:Bullet;
	var _rhythmid:Rhythmid;
	var _block:Block;
	var _block2:Block;
	var oblock:FlxTypedGroup<Block>;
	var _piu:Piu;
	var _one:MinesOne;
	var _cool:Cool;
	var _1:One;
	var _2:Two;
	var _3:Three;
	var _numbers:Numbers;
	var _sideshoot:Bool = false;
	var _score:Int = 0;
	var cplayer:FlxGroup;
	var cmonster:FlxGroup;
	var cam:FlxCamera;
	var defaultZoom:Float = 1.5;
	var _shoot:Bool = false;
	var _createBlock:Bool = false;
	var _timer1:FlxTimer;
	var _timer2:FlxTimer;
	var _spd:Float = 80;
	var _timerBlock:Float = 2;
	var dificulty:Float = 0;
	var _monsterLive:Float = 500;
	var _win:Win;
	var _piupiu:FlxSound;

	override public function create()
	{
		super.create();

		bgColor = 0xff19151b;

		FlxG.debugger.visible = true;
		FlxG.watch.add(this, "dificulty");
		FlxG.watch.add(this, "_monsterLive");
		FlxG.watch.add(this, "_createBlock");
		FlxG.watch.add(this, "_timer2");

		// FlxG.sound.playMusic("assets/music/music.ogg", 1, true);

		// Iniciar Variables
		_rhythmid = new Rhythmid(62, 194);
		_player = new Player(640 / 2 / 1.5 - 15, 450 / 2);
		_badguy = new Monster(160 - 60, 20);
		_badguy.scale.set(1.2, 1.2);
		_numbers = new Numbers(320 / 2, 240 / 2);
		_win = new Win(320 / 2, 240 / 2);
		obafguy = new FlxTypedGroup<Monster>();
		_timer1 = new FlxTimer();
		_timer2 = new FlxTimer();
		_piupiu = FlxG.sound.load("assets/sounds/ClickJam.ogg");
		add(_badguy);
		add(_rhythmid);
		add(_player);
		add(_numbers);

		_timer1.start(0.5, timer1);

		// Camera
		cam = new FlxCamera(0, 0, 640, 480);
		FlxG.cameras.reset(cam);
		cam.target = _player;
		FlxG.camera.setScrollBoundsRect(0, 0, 640 / 1.5, 480 / 1.5);

		// create Groups
		cplayer = new FlxGroup();
		cplayer.add(oblock);

		cmonster = new FlxGroup();
		cmonster.add(_bullet);

		// Start Visible
		_rhythmid.visible = false;
		_badguy.visible = false;
		// _player.visible = false;

		FlxG.camera.fade(FlxColor.BLACK, 1, true);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(_player, _block, collicioncart);
		FlxG.collide(_badguy, _bullet, collicionMonster);

		// Zoom
		if (FlxG.camera.zoom != defaultZoom)
		{
			FlxG.camera.zoom -= 0.07;
		}
		if (FlxG.camera.zoom <= defaultZoom)
		{
			FlxG.camera.zoom = defaultZoom;
		}

		// Number Start
		if (_numbers.animation.finished == true)
		{
			_numbers.visible = false;

			// Dificulty
			if (dificulty >= 1)
			{
				_spd = 280;
				_timerBlock = 1.5;
			}
			if (dificulty >= 2)
			{
				_spd = 380;
				_timerBlock = 1;
			}
			if (dificulty >= 3)
			{
				_spd = 480;
				_timerBlock = 0.5;
			}

			if (_shoot == true)
			{
				if (FlxG.mouse.justPressed)
				{
					_piu = new Piu(_player.x - 100, _player.y - 60);
					add(_piu);
					_bullet = new Bullet(_player.x, _player.y);
					_bullet.scale.set(0.7, 0.7);
					add(_bullet);
					FlxG.cameras.shake(0.004);
					FlxG.camera.zoom += 0.5;
					bgColor = 0xffffffdc;
					FlxG.sound.destroy();
					_piupiu = FlxG.sound.load("assets/images/ClickJam.ogg");
				}
				else
				{
					bgColor = 0xff19151b;
				}
			}

			// if _createBlock == true
			if (_createBlock == true)
			{
				_timer2.start(1, timer2);
				_rhythmid.visible = true;
				_badguy.visible = false;
				_shoot = false;
			}
			else if (_createBlock == false)
			{
				_rhythmid.visible = false;
				_badguy.visible = true;
				_shoot = true;
			}

			if (_monsterLive == 100 || _monsterLive == 200 || _monsterLive == 300 || _monsterLive == 400)
			{
				_createBlock = true;
				_monsterLive -= 1;
				_cool = new Cool(_player.x + 30, _player.y - 70);
				_cool.scale.set(1.2, 1.2);
				add(_cool);
				dificulty += 1;
			}

			// 321
			/*switch (_monsterLive)
				{
					case 103:
						_3 = new Three(_player.x + 10, _player.y - 70);
						add(_3);
						
					case 102:
						_2 = new Two(_player.x + 10, _player.y - 70);
						add(_2);
						
					case 101:
						_1 = new One(_player.x + 10, _player.y - 70);
						add(_1);
						
					case 203:
						_3 = new Three(_player.x + 10, _player.y - 70);
						add(_3);
						
					case 202:
						_2 = new Two(_player.x + 10, _player.y - 70);
						add(_2);
						
					case 201:
						_1 = new One(_player.x + 10, _player.y - 70);
						add(_1);
						
					case 303:
						_3 = new Three(_player.x + 10, _player.y - 70);
						add(_3);
						
					case 302:
						_2 = new Two(_player.x + 10, _player.y - 70);
						add(_2);
						
					case 301:
						_1 = new One(_player.x + 10, _player.y - 70);
						add(_1);
						
					case 403:
						_3 = new Three(_player.x + 10, _player.y - 70);
						add(_3);
						
					case 402:
						_2 = new Two(_player.x + 10, _player.y - 70);
						add(_2);
						
					case 401:
						_1 = new One(_player.x + 10, _player.y - 70);
						add(_1);

			}*/
			/*if (FlxG.keys.justPressed.C)
				{
					_monsterLive -= 100;
			}*/

			// If monster die
			if (_monsterLive == 0)
			{
				_monsterLive -= 1;
				// FlxG.camera.maxScrollX = 1;
				// FlxG.camera.maxScrollY = 1;
				add(_win);
				cam.target = _win;
				FlxG.camera.setScrollBoundsRect(0, 0, 640, 480);
				FlxG.camera.fade(FlxColor.WHITE, 0.8, true);
			}
		}
	}

	public function collicioncart(object_r:FlxObject, py:Player)
	{
		FlxObject.separate(_player, _block);
		FlxG.camera.shake(0.004);
		FlxG.camera.zoom += 0.5;
		_player.x++;
		_block.destroy();
		_createBlock = false;
	}

	public function collicionMonster(object_r:FlxObject, ms:Monster)
	{
		FlxObject.separate(_badguy, _bullet);
		_one = new MinesOne(_player.x - 60, _player.y - 50);
		add(_one);
		_monsterLive -= 1;
		_bullet.destroy();
		_badguy.y += 7;
	}

	public function timer1(deltaT:FlxTimer)
	{
		// Rhythmid Settings
		if (_createBlock == true)
		{
			var _whoBlock:Float = Std.random(6) + 1;
			switch (_whoBlock)
			{
				case 1:
					_block = new Block(426, 181); // 1
					add(_block);
					_block.velocity.x = -_spd;
				case 2:
					_block = new Block(426, 221); // 2
					add(_block);
					_block.velocity.x = -_spd;
				case 3:
					_block = new Block(426, 261); // 3
					add(_block);
					_block.velocity.x = -_spd;
				case 4:
					_block = new Block(426, 261); // 3
					_block2 = new Block(426, 221); // 2
					add(_block);
					add(_block2);
					_block.velocity.x = -_spd;
					_block2.velocity.x = -_spd;
				case 5:
					_block = new Block(426, 261); // 3
					_block2 = new Block(426, 181); // 1
					add(_block);
					add(_block2);
					_block.velocity.x = -_spd;
					_block2.velocity.x = -_spd;
				case 6:
					_block = new Block(426, 221); // 2
					_block2 = new Block(426, 181); // 1
					add(_block);
					add(_block2);
					_block.velocity.x = -_spd;
					_block2.velocity.x = -_spd;
			}
		}
		_timer1.start(_timerBlock, timer1);
	}

	public function timer2(deltaTT:FlxTimer)
	{
		_createBlock = false;
	}
}
