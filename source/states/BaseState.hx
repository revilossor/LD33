package states;
import flixel.FlxG;
import flixel.FlxState;

/**
 * ...
 * @author Oliver Ross
 */
class BaseState extends FlxState
{
	var _isFinishedFading:Bool = false;
	
	override public function create() {
		super.create();
		FlxG.camera.fade(Settings.STATE_FADE_COLOUR, Settings.STATE_FADE_DURATION, true, function() {
			_isFinishedFading = true;
		});
	}
	override public function update() {
		if (_isFinishedFading) { super.update(); }
	}
	function switchState(nextState:Class<FlxState>) {
		FlxG.camera.fade(Settings.STATE_FADE_COLOUR, Settings.STATE_FADE_DURATION, false, function() {
			FlxG.switchState(Type.createInstance(nextState, []));
		});
	}
	function shake(intensity:Float, duration:Float, ?onComplete:Void->Void) {
		FlxG.camera.shake(intensity, duration, onComplete);
	}
}