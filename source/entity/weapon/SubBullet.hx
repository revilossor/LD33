package entity.weapon;
import flixel.util.FlxPoint;

/**	
 * ...
 * @author Oliver Ross
 */
class SubBullet extends Entity
{
	public var type:WeaponType;
	
	public function new(xp:Float, yp:Float, graphic:Dynamic, vector:FlxPoint, type:WeaponType) 
	{
		super(xp, yp, graphic);
		init(xp, yp, graphic, vector, type);
	}
	public function init(xp:Float, yp:Float, graphic:Dynamic, vector:FlxPoint, type:WeaponType) {
		this.alive = true;
		this.exists = true;
		x = xp;
		y = yp;
		loadGraphic(graphic);
		velocity = vector;
		this.type = type;
	}
	
	override public function update() {
		super.update();
		killIfOffscreen();
	}
	function killIfOffscreen() {
		if (!this.isOnScreen()) {
			kill();
		}
	}
	
	function explode() {
		this.kill();
	}
	override public function destroy() {
		type = null;
		super.destroy();
	}
	
}
enum Direction {
	Vertical;
	Horizontal;
	Unimportant;
}