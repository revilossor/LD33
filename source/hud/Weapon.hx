package hud;
import collectable.weapon.WeaponType;
import entity.Entity;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

/**
 * ...
 * @author Oliver Ross
 */
class Weapon extends HudEntity
{
	var _graphic:FlxSprite;
	var _ammoText:FlxText;
	
	public function new(player:Entity) 
	{
		super(player);
		init();
	}
	function init() {
		add(new FlxSprite(FlxG.width - 50, 2, 'assets/images/hud/weapon.png'));
		add(_graphic = new FlxSprite(FlxG.width - 48, 6));
		add(_ammoText = new FlxText(310, 30, 40, '', 16));
		_ammoText.setFormat(null, 16, 0xff2c2c2c, 'right', FlxText.BORDER_NONE);
	}
	public function set(type:WeaponType) {
		_graphic.loadGraphic('assets/images/hud/' + type.launch + '.png');
	}
	
	override public function update() {
		super.update();
		_ammoText.text = '' + Registry.ammo;
	}
}