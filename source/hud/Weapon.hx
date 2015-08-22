package hud;
import collectable.weapon.WeaponType;
import entity.Entity;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Oliver Ross
 */
class Weapon extends HudEntity
{
	var _graphic:FlxSprite;
	
	public function new(player:Entity) 
	{
		super(player);
		init();
	}
	function init() {
		add(new FlxSprite(FlxG.width - 50, 2, 'assets/images/hud/weapon.png'));
		add(_graphic = new FlxSprite(FlxG.width - 48, 6));
	}
	public function set(type:WeaponType) {		// TODO juice the change a bit
		_graphic.loadGraphic('assets/images/hud/' + type.launch + '.png'); // http://www.nooooooooooooooo.com/
	}
	
	
}