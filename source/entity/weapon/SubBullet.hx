package entity.weapon;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxPoint;

/**	
 * ...
 * @author Oliver Ross
 */
class SubBullet extends Entity
{
	public var type:WeaponType;
	
	var _frequency:Float = 0.2;
	var _amplitude:Float = 5;
	var _counter:Int = 0;
	var _sine:Float = 0;
	var _trackSpeed:Float = 10000;
	
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
		_counter = 0;
		_sine = 0;
		loadGraphic(graphic);
		velocity = vector;
		this.type = type;
	}
	
	override public function update() {
		super.update();
		killIfOffscreen();
		if (alive) { doCorrectBehaviour(); }
		if (type.launch == 'mine') {
			if (_counter == 10) { velocity.set(); }
			y += Registry.SCROLL_DELTA; 
		}
	}
	function killIfOffscreen() {
		if (!this.isOnScreen()) {
			kill();
		}
	}
	function doCorrectBehaviour() {
		_counter++;
		if(_counter > 10) {
			switch type.flight {
				case 'seeking':	// need to know bout baddies ?????
				case 'tracking': doTracking();
				case 'wobble':	doSineWobble();
			}
		}
	}
	function doSineWobble() {
		switch(getDirection()) {
			case Direction.Vertical : x += getSine();		// this maight fuck up collision detection
			case Direction.Horizontal : y += getSine();
			case Unimportant:
		}
	}
	function doTracking() {
		if (_counter > 30) { velocity.set(); }
		if (FlxG.keys.anyPressed(Keys.UP))		{ velocity.y -= (_trackSpeed * FlxG.elapsed); }
		if (FlxG.keys.anyPressed(Keys.DOWN))	{ velocity.y += (_trackSpeed * FlxG.elapsed); }
		if (FlxG.keys.anyPressed(Keys.LEFT))	{ velocity.x -= (_trackSpeed * FlxG.elapsed); }
		if (FlxG.keys.anyPressed(Keys.RIGHT))	{ velocity.x += (_trackSpeed * FlxG.elapsed); }
		if (FlxG.keys.anyPressed(Keys.ACTION)) 	{ explode(); }
		if (_counter > 300) { explode(); }
	}
	function getSine() {
		return _amplitude * Math.sin(_frequency * _counter + 0.5);
	}
	function getDirection() {
		if (type.launch == 'spread') { return Direction.Vertical; }
		if (velocity.x != 0 && velocity.y == 0) { return Direction.Horizontal; }
		else if(velocity.x == 0) { return Direction.Vertical; }
		return Direction.Unimportant;
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