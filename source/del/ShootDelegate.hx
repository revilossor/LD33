package del;
import collectable.weapon.Weapon;
import collectable.weapon.WeaponType;
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
		return _counter == 0 && _weapon != null && _weapon.hasAmmo();
	}
	
	public function setWeapon(to:WeaponType) { _weapon = Type.createInstance(Weapon, [to]); }
	
	public function fire() {
		_counter = _weapon.type.cooldown;
		trace('shoot ' + _weapon.type.launch + ' ' + _weapon.type.flight + ' ' + _weapon.type.payload );
	}
	
}