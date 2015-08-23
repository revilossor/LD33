package del;
import entity.obstacle.ObstacleGroup;
import entity.obstacle.ObstacleType;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class ObstaclesDelegate extends FlxGroup
{	
	public function new() {
		super();
		var test:ObstacleType = {
			img:'assets/images/entity/cactus.png',
			number:10,
			baddies:1,
			height:100
		}
		addObstacles(0, -test.height, test);
	}
	
	override public function update() {
		super.update();
	}
	
	function addObstacles(xp:Float, yp:Float, type:ObstacleType) {
		var revived:ObstacleGroup= cast(getFirstDead());
		if (revived != null) {
			revived.init(xp, yp, type);
			return;
		}
		add(new ObstacleGroup(xp, yp, type));
		return;
	}
	
	
	
	
}