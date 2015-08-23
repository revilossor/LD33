package states;
import del.Delegates;
import entity.Collectable;
import entity.level.Level;
import entity.Player;
import entity.weapon.WeaponType;
import flixel.FlxG;
import flixel.FlxSprite;
import hud.Hud;

/**
 * ...
 * @author Oliver Ross
 */ 
class PlayState extends BaseState
{
	var _level:Level;
	var _player:Player;
	var _hud:Hud;
	var _delegates:Delegates;
	
	override public function create() {
		super.create();
		FlxG.camera.bgColor = 0xffFFBB00;
		init();
	}
	function init() {
		add(_level = new Level());
		add(_player = new Player());
		add(_hud = new Hud(_player.core));
		add(_delegates = new Delegates());
		
		var weapon:WeaponType = {
			ammo:10,
			maxAmmo:10,
			cooldown:30,
			payload:'slug',				// slug, dynamite
			launch:'handgun'			// handgun, spread
		};
		changePlayerWeapon(weapon);
	}
	override public function update() {
		super.update();
		collisionHandling();
		chaseHandling();
		
		
		
		
	}
	function collisionHandling() {
		FlxG.collide(_player.core, _level.bounds, doTest);		// TODO remember to remove meeeeeeeeeeeeeee
	}
	function doTest(a:FlxSprite, b:FlxSprite) {
		var four:WeaponType = {
			ammo:3,
			maxAmmo:10,
			cooldown:200,
			payload:'dynamite',
			launch:'spread'
		};
		changePlayerWeapon(four);
	}
	
	function chaseHandling() {
		_hud.changeDistance(_delegates.getChaseDistance());
	}
	
	function changePlayerWeapon(to:WeaponType) {
		_player.setWeapon(to);
		_hud.changeWeapon(to);
	}
}