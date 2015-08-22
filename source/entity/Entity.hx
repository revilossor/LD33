package entity;
import flixel.FlxSprite;

/**
 * ...
 * @author Oliver Ross
 */
class Entity extends FlxSprite
{

	public function new(xp:Float, yp:Float, ?graphic:Dynamic = null) 
	{
		super(xp, yp, graphic);
	}
	override public function update() {
		super.update();	
	}
	
}