package hud;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Oliver Ross
 */
class Health extends HudEntity
{
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(new FlxSprite(290, 564, 'assets/images/hud/health-heart.png'));
		add(new FlxSprite(326, 564, 'assets/images/hud/health-heart.png'));
		add(new FlxSprite(363, 564, 'assets/images/hud/health-heart.png'));
	}
	public function changeHealth(by:Int) {
		Registry.health += by;
		if (Registry.health > 2) { Registry.health = 2; }
		else if (Registry.health < 0) { Registry.health = 0; }
		switch(Registry.health) {
			case 0:
				hide([0, 1, 2]);
			case 1:
				hide([1, 2]);
				show([0]);
			case 2:
				hide([2]);
				show([0, 1]);
			case 3:
				show([0, 1, 2]);
		}
	}
	function hide(indexes:Array<Int>) {
		for (index in indexes) {
			FlxTween.tween(members[index], { y:610 }, 0.2, { ease: FlxEase.circOut, type: FlxTween.ONESHOT } );
		}
	}
	function show(indexes:Array<Int>) {
		for (index in indexes) {
			FlxTween.tween(members[index], { y:564 }, 0.2, { ease: FlxEase.bounceIn, type: FlxTween.ONESHOT } );
		}
	}
}