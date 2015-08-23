package entity.level;
import entity.Collectable;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Level extends FlxGroup
{
	public var bounds:Bounds;
	public var collectables:FlxGroup;
	
	var c:Int = 0;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(bounds = new Bounds());
		add(new Grounds());
		add(new LevelLayer('assets/images/level/tracks.png'));
		add(collectables = new FlxGroup());
	}
	
	override public function update() {
		super.update();
		if (c++ > 300) {
			if (Registry.ammo == 0) { spawnCollectable(); }
			c = 0;
		}
	}
	
	public function spawnCollectable(?xp:Float = null, ?yp:Float = null) {
		if (xp == null) { xp = 150 + Math.floor(Math.random() * (100 - 32)); }
		if (yp == null) { yp = -32; }
		var revived:Collectable = cast(collectables.getFirstDead());
		if (revived != null) {
			revived.init(xp, yp);
			return;
		}
		collectables.add(new Collectable(xp, yp));
		return;
	}
	
}