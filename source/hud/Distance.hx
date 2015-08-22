package hud;
import flixel.FlxSprite;

/**
 * ...
 * @author Oliver Ross
 */
class Distance extends HudEntity
{
	var _goodie:FlxSprite;
	var _baddie:FlxSprite;
	var _midpoint = 124;
	
	public function new(_player) 
	{
		super(_player);
		init();
	}
	function init() {
		add(new FlxSprite(2, 560, 'assets/images/hud/distance-guage.png'));
		add(_baddie = new FlxSprite(0, 560, 'assets/images/hud/baddie.png'));
		add(_goodie = new FlxSprite(0, 560, 'assets/images/hud/goodie.png'));
		set(50);
	}
	public function set(to:Int) {
		var delta = getChaseDelta(to * 0.01);
		_goodie.x = _midpoint - Math.floor(delta / 2);
		_baddie.x = _midpoint + Math.floor(delta / 2);
	}
	function getChaseDelta(percent:Float) { return 244 * percent; }
}