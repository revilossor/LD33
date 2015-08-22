package hud;
import entity.Entity;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Hud extends FlxGroup
{
	var _player:Entity;
	
	var _wanted:Wanted;
	var _health:Health;
	var _distance:Distance;
	
	public function new(player:Entity) 
	{
		super();
		_player = player;
		init();
	}
	function init() {
		add(_wanted = new Wanted(_player));
		add(_health = new Health(_player));
		add(_distance = new Distance(_player));
	}
	
	public function changeHealth(by:Int)	{ _health.change(by);	}
	public function changeReward(by:Int)	{ _wanted.change(by);	}
	public function changeDistance(to:Int)	{ _distance.set(to);	}
}