package entity;

/**
 * ...
 * @author Oliver Ross
 */
class Collectable extends Entity
{
	var _beenOnScreen = false;
	
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, 'assets/images/level/collectable.png');
		init(xp, yp);
	}
	public function init(xp:Float, yp:Float) {
		x = xp;
		y = yp;
		alive = true;
		exists = true;
	}
	
	override public function update() {
		super.update();
		y += Registry.SCROLL_DELTA;
		if (!_beenOnScreen) {
			if (isOnScreen()) { _beenOnScreen = true; }
		}else {
			if (!isOnScreen()) { this.kill(); }
		}
	}
	
}