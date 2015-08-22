package hud;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Hud extends FlxGroup
{
	var _wanted:Wanted;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(_wanted = new Wanted());
	}
}