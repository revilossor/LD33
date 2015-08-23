package entity.level;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Grounds extends FlxGroup
{

	var _front:FlxSprite;
	var _back:FlxSprite;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		_front = getGraphic();
		_back = getGraphic();
		_back.y = -_front.height;
		add(_front);
		add(_back);
	}
	function getGraphic() {
		var g:FlxSprite = new FlxSprite();
		g.loadGraphic('assets/images/level/grounds.png', true, 400, 600);
		g.animation.add('0', [0]);
		g.animation.add('1', [1]);
		g.animation.add('2', [2]);
		g.animation.add('3', [3]);
		g.animation.add('4', [4]);
		g.animation.play('' + Math.floor(Math.random() * 5));
		return g;
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
		if (_front.y > FlxG.height) { 
			_front.y = _back.y - _front.height;
			_front.animation.play('' + Math.floor(Math.random() * 5));
		}
		if (_back.y > FlxG.height) { 
			_back.y = _front.y - _back.height;
			_back.animation.play('' + Math.floor(Math.random() * 5));
		}
	}
	
	
}