package states;
import entity.Player;
import flixel.FlxG;

/**
 * ...
 * @author Oliver Ross
 */
class PlayState extends BaseState
{
	var _player:Player;
	
	override public function create() {
		super.create();
		FlxG.camera.bgColor = 0xffFFBB00;
		init();
	}
	function init() {
		add(_player = new Player());
	}
}