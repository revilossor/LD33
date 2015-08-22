package hud;
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
	override public function update() {
		super.update();
		if (FlxG.overlap(this, Registry.player.core)) {
			for (member in members) {
				FlxTween.tween(member, { alpha : 0 }, 0.2, { ease: FlxEase.circOut, type: FlxTween.ONESHOT});
			}
		} else {
			for (member in members) {
				FlxTween.tween(member, { alpha : 1 }, 0.2, { ease: FlxEase.circIn, type: FlxTween.ONESHOT});
			}
		}
	}
}