package entity.weapon;

/**
 * ...
 * @author Oliver Ross
 */
class Weapon
{
	public var type:WeaponType;
	
	public function new(type:WeaponType) 
	{
		this.type = type;
	}
	public function changeAmmo(by:UInt) {
		Registry.ammo += by;
		if (Registry.ammo > type.maxAmmo) { Registry.ammo = type.maxAmmo; }
	}
}