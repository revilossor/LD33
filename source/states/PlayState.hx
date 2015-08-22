package states;
import entity.level.Level;
import entity.Player;
import flixel.FlxG;
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
	
	override public function create() {
		super.create();
		FlxG.camera.bgColor = 0xffFFBB00;
		init();
	}
	function init() {
		add(_level = new Level());
		add(_player = new Player());
		add(_hud = new Hud());
	}
	
	override public function update() {
		super.update();
		collisionHandling();
		
		Registry.reward++;
		
		
	}
	function collisionHandling() {
		FlxG.collide(_player.core, _level.bounds, doSmallShake);
	}
	
}