package hud;
import entity.Entity;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Oliver Ross
 */
class HudEntity extends FlxGroup
{
	var _player:Entity;
	var _isOff:Bool = false;
	
	public function new(player:Entity)
	{
		super();
		_player = player;
	}
	
	override public function update() {
		super.update();
		if(!_isOff) {
			if (FlxG.overlap(this, _player)) {
				for (member in members) {
					FlxTween.tween(member, { alpha : 0.3 }, 0.2, { ease: FlxEase.circOut, type: FlxTween.ONESHOT, complete:function(tween){
						_isOff = true;
					}});
				}
			}
		} else {
			if(!FlxG.overlap(this, _player)) {
				for (member in members) {
					FlxTween.tween(member, { alpha : 1 }, 0.2, { ease: FlxEase.circIn, type: FlxTween.ONESHOT});
				}
				_isOff = false;
			}
		}
	}
}