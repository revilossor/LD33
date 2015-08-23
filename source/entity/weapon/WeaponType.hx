package entity.weapon;

/**
 * @author Oliver Ross
 */
typedef WeaponType =
{
	ammo:Int,
	maxAmmo:Int,
	cooldown:Int,		// fast, medium  or slow, == revolver, semi-auto or automatic
	payload:String,		// slug, dynamite (remove gold, chloroform) 
	launch:String,		// handgun, spread (remove fourway, mine)
	//flight:String		// straight (remove seeking, tracking, wobbly) ( do frames that do 1,2,3 damage )	  
}