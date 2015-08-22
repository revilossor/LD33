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
	var _ammoGraphic:FlxSprite;
	
	public function new(player:Entity) 
	{
		super(player);
		init();
	}
	function init() {
		add(new FlxSprite(FlxG.width - 50, 2, 'assets/images/hud/weapon.png'));
		add(_graphic = new FlxSprite(FlxG.width - 48, 6));
		add(_ammoGraphic = new FlxSprite(308, 2));
		add(_ammoText = new FlxText(310, 30, 40, '', 12));
		_ammoText.setFormat(null, 12, 0xff2c2c2c, 'center', FlxText.BORDER_NONE);
	}
	public function set(type:WeaponType) {
		_graphic.loadGraphic('assets/images/hud/' + type.launch + '.png');
		_ammoGraphic.loadGraphic('assets/images/hud/' + type.payload + '.png');
	}
	
	override public function update() {
		super.update();
		_ammoText.text = '' + Registry.ammo;
	}
}