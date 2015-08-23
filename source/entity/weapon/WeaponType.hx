package entity.weapon;

/**
 * @author Oliver Ross
 */
typedef WeaponType =
{
	ammo:Int,
	maxAmmo:Int,
	cooldown:Int,
	payload:String,		// slug, dynamite (remove gold, chloroform) 
	launch:String,		// handgun, spread (remove fourway, mine)
	flight:String		// straight, wobbly	(remove seeking, tracking) ( do frames that do 1,2,3 damage )	  
}