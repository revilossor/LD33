package hud;
import entity.weapon.WeaponType;
import entity.Entity;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Hud extends FlxGroup
{
	var _player:Entity;
	
	var _wanted:Wanted;
	var _health:Health;
	var _distance:Distance;
	var _weapon:Weapon;
	var _weaponText:WeaponText;
	
	public function new(player:Entity) 
	{
		super();
		_player = player;
		init();
	}
	function init() {
		add(_wanted = new Wanted(_player));
		add(_health = new Health(_player));
		add(_distance = new Distance(_player));
		add(_weapon = new Weapon(_player));
		add(_weaponText = new WeaponText(_player));
	}
	
	public function changeHealth(by:UInt)		{ _health.change(by);	}
	public function changeReward(by:UInt)		{ _wanted.change(by);	}
	public function changeDistance(to:Int)		{ _distance.set(to);	}
	public function changeWeapon(to:WeaponType)	{ 
		_weapon.set(to);
		_weaponText.set(to);
	}
}