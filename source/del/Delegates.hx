package del;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Delegates extends FlxGroup
{
	var _chase:ChaseDelegate;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(_chase = new ChaseDelegate());
	}
	
	public function getChaseDistance() { return _chase.getChaseDistance(); }
}