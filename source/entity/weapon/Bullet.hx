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
			case 'fourway': doFourway(type, xp, yp); 
			case 'mine': doMine(type, xp, yp);
		}
	}
	function doHandgun(type:WeaponType, xp:Float, yp:Float) {
		add(new SubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -500), type));
	}
	function doSpread(type:WeaponType, xp:Float, yp:Float) {
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -320), type));
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(-60, -300), type));
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(60, -300), type));
	}
	function doFourway(type:WeaponType, xp:Float, yp:Float) {
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, -300), type));
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(0, 300), type));
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(-200, 0), type));
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.weak(200, 0), type));
	}
	function doMine(type:WeaponType, xp:Float, yp:Float) {
		add(getSubBullet(xp, yp, 'assets/images/bullet/' + type.payload + '.png', FlxPoint.get(0, 200), type));
	}
	
	override public function update() {
		super.update();
		if (getFirstAlive() == null) { trace('kill bullet');  this.kill(); }
	}
	
	function getSubBullet(xp:Float, yp:Float, graphic:Dynamic, vector:FlxPoint, type:WeaponType) {
		var revived:SubBullet = cast(getFirstDead());
		trace('revived is ' + revived + ' length is ' + members.length);
		if (revived != null) {
			revived.init(xp, yp, graphic, vector, type);
			trace('recycle subBullet');
			return revived;
		}
		trace('new subBullet');
		return new SubBullet(xp, yp, graphic, vector, type);
	}
}