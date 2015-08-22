package entity.level;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class LevelLayer extends FlxGroup
{
	var _front:FlxSprite;
	var _back:FlxSprite;

	public function new(graphic:Dynamic) 
	{
		super();
		init(graphic);
	}
	function init(graphic:Dynamic) {
		_front = new FlxSprite(0, 0, graphic);
		_back = new FlxSprite(0, -_front.height, graphic);
		add(_front);
		add(_back);
	}
	
	override public function update() {
		super.update();
		doScroll();
		doRepositioning();
	}
	function doScroll() {
		_front.y += Registry.SCROLL_DELTA;
		_back.y += Registry.SCROLL_DELTA;
	}
	function doRepositioning() {
		if (_front.y > FlxG.height) { _front.y = _back.y - _front.height; }
		if (_back.y > FlxG.height) { _back.y = _front.y - _back.height; }
	}
	
}