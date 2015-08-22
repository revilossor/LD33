package entity.level;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Level extends FlxGroup
{
	public var bounds:Bounds;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(bounds = new Bounds());
		add(new LevelLayer('assets/images/level/tracks.png'));
	}
	
}