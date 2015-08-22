package collectable.weapon;
import collectable.Collectable;

/**
 * ...
 * @author Oliver Ross
 */
class Weapon
{
	public var type:WeaponType;
	var _ammo:Int;
	
	public function new(type:WeaponType) 
	{
		//super();
		this.type = type;
		_ammo = type.ammo;
	}
	public function hasAmmo() { return _ammo > 0; }
	public function changeAmmo(by:UInt) {
		_ammo += by;
		if (_ammo > type.maxAmmo) { _ammo = type.maxAmmo; }
	}
	
}