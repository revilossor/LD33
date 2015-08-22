package states;
import del.Delegates;
import entity.level.Level;
import entity.Player;
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
	}
	override public function update() {
		super.update();
		collisionHandling();
		chaseHandling();
	}
	function collisionHandling() {
		FlxG.collide(_player.core, _level.bounds);
	}
	function chaseHandling() {
		_hud.changeDistance(_delegates.getChaseDistance());
	}
}