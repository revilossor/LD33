package states;
import flixel.FlxG;

/**
 * ...
 * @author Oliver Ross
 */
class MenuState extends BaseState
{
	override public function create() {
		super.create();
		FlxG.camera.bgColor = 0xffff0000;
	}
	override public function update() {
		super.update();
		keyHandling();
	}
	function keyHandling() {
		if (FlxG.keys.anyJustReleased(Keys.ANY)) {
			FlxG.keys.reset();
			switchState(PlayState);
		}
	
	}
	
}