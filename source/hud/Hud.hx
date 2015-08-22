package hud;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Hud extends FlxGroup
{
	var _wanted:Wanted;
	var _health:Health;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(_wanted = new Wanted());
		add(_health = new Health());
	}
	
	public function changeHealth(by:Int) {
		_health.changeHealth(by);
	}
}