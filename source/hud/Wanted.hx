package hud;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.text.FlxText;

/**
 * ...
 * @author Oliver Ross
 */
class Wanted extends HudEntity
{
	var _text:FlxText;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(new FlxSprite(2, 2, 'assets/images/hud/wanted.png'));
		add(_text = new FlxText(11, 10, 120, '$' + Registry.reward, 18));
		_text.setFormat(null, 16, 0xff2c2c2c, 'center', FlxText.BORDER_NONE);
	}
	
	override public function update() {
		super.update();
		_text.text = '$' + Registry.reward;
	}
	
}