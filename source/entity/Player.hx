package entity;
import entity.weapon.Bullet;
import entity.weapon.WeaponType;
import del.ShootDelegate;
import flixel.FlxG;
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
	
	var _shootable:ShootDelegate;
	public var bullets:FlxGroup;
	
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
	}
	function getCore() {
		core = new Entity(184, _start);
		core.makeGraphic(32, 48, 0xffff00ff);
		return core;
	}
	function setPhysics() {
		core.drag.set(300, 300);
		core.maxVelocity.set(150, 150);
	}
	
	override public function update() {
		keyHandling();
		scrollHandling();
		super.update();
	}
	function keyHandling() {
		if(FlxG.keys.anyPressed(Keys.UP))		{ core.velocity.y -= _speed; }
		if(FlxG.keys.anyPressed(Keys.DOWN))		{ core.velocity.y += _speed; }
		if(FlxG.keys.anyPressed(Keys.LEFT))		{ core.velocity.x -= _speed; }
		if(FlxG.keys.anyPressed(Keys.RIGHT))	{ core.velocity.x += _speed; }
		if (FlxG.keys.anyPressed(Keys.ACTION) && _shootable.canShoot()) { playerShoot(); }
	}
	function scrollHandling() {
		Registry.SCROLL_DELTA = Math.floor(((core.y < _start) ? _start - core.y : 0) * Registry.SCROLL_COEFFICIENT);
	}
	function playerShoot() {
		bullets.add(new Bullet(_shootable.getBullet(), core.getMidpoint().x, core.getMidpoint().y));
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