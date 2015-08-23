package entity.level;
import entity.Collectable;
import flixel.FlxG;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Level extends FlxGroup
{
	public var bounds:Bounds;
	public var collectables:FlxGroup;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(bounds = new Bounds());
		add(new LevelLayer('assets/images/level/tracks.png'));
		add(collectables = new FlxGroup());
		
		spawnCollectable();
		
	}
	
	public function spawnCollectable(?xp:Float = null, ?yp:Float = null) {
		if (xp == null) { xp = Math.floor(Math.random() * (FlxG.width - 32)); }
		if (yp == null) { yp = -32; }
		var revived:Collectable = cast(collectables.getFirstDead());
		if (revived != null) {
			trace('reive collectable');
			revived.init(xp, yp);
			return;
		}
		trace('new collectable at ' + xp + ', ' + yp);
		collectables.add(new Collectable(xp, yp));
		return;
	}
	
	
}