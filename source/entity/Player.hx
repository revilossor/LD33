package entity;
import del.ShootDelegate;
import entity.weapon.Bullet;
import entity.weapon.WeaponType;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Player extends FlxGroup
{
	static inline var _speed = 15;
	static inline var _start = 500;
	public var core:Entity;
	var _anim:FlxSprite;
	
	var _shootable:ShootDelegate;
	public var bullets:FlxGroup;
	
	var _isShooting:Bool = false;
	var _sc = 0;
	
	public function new()
	{
		super();
		init();
	}
	function init() {
		add(core = getCore());
		add(_shootable = new ShootDelegate());
		setPhysics();
		add(bullets = new FlxGroup());
		add(_anim = getAnim());
	}
	function getCore() {
		core = new Entity(184, _start);
		core.makeGraphic(32, 32, 0x00000000);
		return core;
	}
	function setPhysics() {
		core.drag.set(300, 300);
		core.maxVelocity.set(150, 150);
	}
	function getAnim() {
		var a = new FlxSprite(core.x-6, core.y-8);
		a.loadGraphic('assets/images/entity/player.png', true, 44, 40);
		a.animation.add('stand', [0]);
		a.animation.add('shoot', [4,4,4,4], 10);
		a.animation.add('walk', [1, 2, 3, 2,],10);
		a.animation.add('walkest', [1,2,3,2],12);
		a.animation.add('run', [1,2,3,2],14);
		a.animation.add('runest', [1, 2, 3, 2], 16);
		a.animation.add('sprint', [1, 2, 3, 2], 18);
		a.animation.play('stand');
		return a;
	}
	
	override public function update() {
		keyHandling();
		scrollHandling();
		_anim.x = core.x - 6;
		_anim.y = core.y - 8;
		animHandling();
		super.update();
	}
	function keyHandling() {
		if(FlxG.keys.anyPressed(Keys.UP))		{ core.velocity.y -= _speed; }
		if(FlxG.keys.anyPressed(Keys.DOWN))		{ core.velocity.y += _speed; }
		if(FlxG.keys.anyPressed(Keys.LEFT))		{ core.velocity.x -= _speed; }
		if(FlxG.keys.anyPressed(Keys.RIGHT))	{ core.velocity.x += _speed; }
		if (FlxG.keys.anyPressed(Keys.ACTION) && _shootable.canShoot()) { playerShoot(); }
	}
	function animHandling() {
		if (_isShooting) { 
			_anim.animation.play('shoot');
			if (_sc++ > 10) { _isShooting = false; _sc = 0; }
		}else if (Registry.SCROLL_DELTA != 0 || (core.velocity.x != 0 || core.velocity.y != 0)) {
			switch(Registry.SCROLL_DELTA) {
				case 0: _anim.animation.play('walk');
				case 1: _anim.animation.play('walkest');
				case 2: _anim.animation.play('run');
				case 3: _anim.animation.play('runest');
				case 4: _anim.animation.play('sprint');
				default: _anim.animation.play('sprint');
			}
		}else {
			_anim.animation.play('stand');
		}
	}
	function scrollHandling() {
		Registry.SCROLL_DELTA = Math.floor(((core.y < _start) ? _start - core.y : 0) * Registry.SCROLL_COEFFICIENT);
	}
	function playerShoot() {
		_isShooting = true;
		addBullet(_shootable.getBullet(), core.getMidpoint().x - 4, core.getMidpoint().y - 8);
	}
	function addBullet(type:WeaponType, xp:Float, yp:Float)  {
		var revived:Bullet = cast(bullets.getFirstDead());
		if (revived != null) {
			revived.init(type, xp, yp);
			return;
		}
		bullets.add(new Bullet(type, xp, yp));
		return;
	}
	
	public function setWeapon(to:WeaponType) {
		_shootable.setWeapon(to);
		Registry.ammo = to.ammo;
	}
	
	override public function destroy() {
		core.destroy();
		super.destroy();
	}
}