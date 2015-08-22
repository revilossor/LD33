package entity.weapon;
import flixel.group.FlxGroup;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Oliver Ross
 */
class Bullet extends FlxGroup
{
	public function new(type:WeaponType, xp:Float, yp:Float) 
	{
		super();
		init(type, xp, yp);
	}
	function init(type:WeaponType, xp:Float, yp:Float) {
		switch type.launch {
			case 'handgun': doHandgun(type, xp, yp); 
			case 'spread': doSpread(type, xp, yp);
			case 'fourway': doFourway(type, xp, yp); 
			case 'mine': doMine(type, xp, yp);
		}
	}
	function doHandgun(type:WeaponType, xp:Float, yp:Float) {
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -500), type));
	}
	function doSpread(type:WeaponType, xp:Float, yp:Float) {
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -320), type));
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(-60, -300), type));
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(60, -300), type));
	}
	function doFourway(type:WeaponType, xp:Float, yp:Float) {
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -300), type));
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, 300), type));
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(-200, 0), type));
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(200, 0), type));
	}
	function doMine(type:WeaponType, xp:Float, yp:Float) {
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.get(0, 200), type));
	}
}