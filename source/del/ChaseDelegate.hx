package del;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class ChaseDelegate extends FlxGroup
{
	override public function update() {
		super.update();
		Registry.distance += Registry.SCROLL_DELTA - Registry.CHASE_SPEED;
		
		if (Registry.distance < 0) { Registry.distance = 0; }
		else if (Registry.distance > 1000) { Registry.distance = 1000; }
	}
	public function getChaseDistance() {
		return Math.ceil(Registry.distance * 0.1);
	}
}