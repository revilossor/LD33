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
	public function init(type:WeaponType, xp:Float, yp:Float) {
		this.alive = true;
		this.exists = true;
		switch type.launch {
			case 'handgun': doHandgun(type, xp, yp); 
			case 'spread': doSpread(type, xp, yp);
		}
	}
	function doHandgun(type:WeaponType, xp:Float, yp:Float) {
		getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -500), type);
	}
	function doSpread(type:WeaponType, xp:Float, yp:Float) {
		getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -320), type);
		getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(-60, -300), type);
		getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(60, -300), type);
	}
	
	override public function update() {
		super.update();
		if (getFirstAlive() == null) { this.kill(); }
	}
	
	function getSubBullet(xp:Float, yp:Float, graphic:Dynamic, vector:FlxPoint, type:WeaponType) {
		var revived:SubBullet = cast(getFirstDead());
		if (revived != null) {
			revived.init(xp, yp, graphic, vector, type);
			return;
		}
		add(new SubBullet(xp, yp, graphic, vector, type));
		return;
	}
}