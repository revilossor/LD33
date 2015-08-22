package entity.level;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Bounds extends FlxGroup
{

	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(getRect(0, -10, FlxG.width, 10));
		add(getRect(0, FlxG.height, FlxG.width, 10));		// bottom
		add(getRect(-10, 0, 10, FlxG.height));
		add(getRect(FlxG.width, 0, 10, FlxG.height));		
	}
	function getRect(xp:Float, yp:Float, width:Int, height:Int) {
		var rect = new FlxSprite(xp, yp);
		rect.immovable = true;
		return rect.makeGraphic(width, height, 0x00ff00ff);
	}
	
}