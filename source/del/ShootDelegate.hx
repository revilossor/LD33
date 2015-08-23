package del;
import entity.weapon.Weapon;
import entity.weapon.WeaponType;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class ShootDelegate extends FlxGroup
{
	var _counter:Int = 0;
	var _weapon:Weapon;
	
	override public function update() {
		super.update();
		if (_counter-- < 0) { _counter = 0; }
	}
	public function canShoot() {
		return _counter == 0 && _weapon != null && Registry.ammo > 0;
	}
	
	public function setWeapon(to:WeaponType) { _weapon = new Weapon(to); }
	
	public function getBullet() {
		_counter = _weapon.type.cooldown;
		Registry.ammo--;
		if (Registry.ammo < 0) { Registry.ammo = 0; }
		trace('shoot ' + _weapon.type.launch + ' ' + _weapon.type.payload );
		return _weapon.type;
	}
	
}