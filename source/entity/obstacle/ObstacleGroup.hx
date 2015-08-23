package entity.obstacle;
import entity.obstacle.Obstacle;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Oliver Ross
 */
class ObstacleGroup extends FlxSpriteGroup
{
	public function new(xp:Float, yp:Float, type:ObstacleType)
	{
		super();
		init(xp, yp, type);
	}
	public function init(xp:Float, yp:Float, type:ObstacleType) {
		alive = true;
		exists = true;
		x = xp;
		y = yp - 64;
		var pos:FlxPoint;
		for(i in 0...type.number) {
			pos = getPosInArea(type.height);
			addObstacle(pos.x, pos.y, type.img);
		}
	}
	function getPosInArea(h:Float) {
		return FlxPoint.weak(Math.round(Math.random() * FlxG.width), Math.round(Math.random() * h));
	}
	function addObstacle(xp:Float, yp:Float, graphic:Dynamic) {
		var revived:Obstacle = cast(getFirstDead());
		if (revived != null) {
			revived.init(xp, yp);
			return;
		}
		add(new Obstacle(xp, yp, graphic));
		return;
	}
	
	override public function update() {
		super.update();
		y += Registry.SCROLL_DELTA;
		if (getFirstAlive() == null) { this.kill(); }
	}
}