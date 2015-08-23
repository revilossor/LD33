package entity.weapon;

/**
 * @author Oliver Ross
 */
typedef WeaponType =
{
	ammo:Int,
	maxAmmo:Int,
	payload:String,		// slug, dynamite (remove gold, chloroform) 
	launch:String,		// handgun, launcher (remove fourway, mine)
	//flight:String		// straight (remove seeking, tracking, wobbly) ( do frames that do 1,2,3 damage )
	rate:String			// revolver, 'semi-automatic', automatic
}