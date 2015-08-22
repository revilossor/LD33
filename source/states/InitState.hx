package states;
import flixel.FlxG;
import flixel.FlxState;

/**
 * ...
 * @author Oliver Ross
 */
class InitState extends FlxState
{
	override public function create() {
		super.create();
		FlxG.camera.bgColor = Settings.STATE_FADE_COLOUR;
		
		// ... any setup stuff ...
		
		onInitComplete();
	}
	
	function onInitComplete() {
		FlxG.switchState(new MenuState());
	}
	
}