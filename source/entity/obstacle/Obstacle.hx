package entity.obstacle;

/**
 * ...
 * @author Oliver Ross
 */
class Obstacle extends Entity
{
	var _beenOnScreen:Bool = false;
	
	
	public function new(xp:Float, yp:Float, ?graphic:Dynamic = null) 
	{
		super(xp, yp, graphic);
		init(xp, yp, graphic);
		immovable = true;
	}
	public function init(xp:Float, yp:Float, ?graphic:Dynamic = null) {
		this.alive = true;
		this.exists = true;
		_beenOnScreen = false;
		x = xp;
		y = yp;
		loadGraphic(graphic);		
	}
	
	override public function update() {
		super.update();
		if (!_beenOnScreen) {
			if (isOnScreen()) { _beenOnScreen = true; }
		}else {
			if (!isOnScreen()) {
				this.kill();	
			}
		}
	}
}