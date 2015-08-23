package hud;
import entity.Entity;
import entity.weapon.WeaponType;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Oliver Ross
 */
class WeaponText extends HudEntity
{
	var _text:FlxText;
	
	var _pauseFor:Int = 0;
	var _isPaused:Bool = false;
	
	public function new(player:Entity) 
	{
		super(player);
		init();
	}
	function init() {
		add(_text = new FlxText(-FlxG.width, 525, FlxG.width, '', 16));
		_text.setFormat(null, 16, 0xff2c2c2c, 'center', FlxText.BORDER_NONE);
	}
	public function set(type:WeaponType) {
		_text.text = type.rate + ' ' + type.payload + ' ' + type.launch + ' get!';
		FlxTween.tween(_text, { x : 0 }, 0.2, { ease: FlxEase.circIn, type: FlxTween.ONESHOT, complete:function(tween){
			_pauseFor = 60;
			_isPaused = true;
		}});
	}
	override public function update() {
		super.update();
		if (_isPaused) {
			if (_pauseFor-- <= 0) {
				FlxTween.tween(_text, { x : FlxG.width }, 0.2, { ease: FlxEase.circOut, type: FlxTween.ONESHOT, complete:function(tween){
					_pauseFor = 0;
					_isPaused = false;
					_text.x = -FlxG.width;
				}});
			}
		}
	}
	
}