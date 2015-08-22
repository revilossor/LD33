package collectable.weapon;

/**
 * @author Oliver Ross
 */
typedef WeaponType =
{
	ammo:Int,
	maxAmmo:Int,
	cooldown:Int,
	payload:String,		// slug, dynamite, gold, chloroform 
	launch:String,		// handgun, spread, fourway, mine
	flight:String		// straight, seeking, tracking, wobbly  
}