package entity;
import entity.weapon.WeaponType;

/**
 * ...
 * @author Oliver Ross
 */
class Collectable extends Entity
{
	var _beenOnScreen = false;
	
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, 'assets/images/level/collectable.png');
		init(xp, yp);
	}
	public function init(xp:Float, yp:Float) {
		x = xp;
		y = yp;
		alive = true;
		exists = true;
		_beenOnScreen = false;
	}
	
	override public function update() {
		super.update();
		y += Registry.SCROLL_DELTA;
		if (!_beenOnScreen) {
			if (isOnScreen()) { _beenOnScreen = true; }
		}else {
			if (!isOnScreen()) {
				this.kill();	
			}
		}
	}
	
	public function getWeapon() {
		var rate = getFireRate();
		var newWeapon:WeaponType = {
			ammo: 4 + Math.floor(Math.random() * 7),
			maxAmmo:10,
			payload:getPayload(),
			launch:getLauncher(),
			rate:getFireRate()
		};
		return newWeapon;
	}
	function getFireRate() {
		var a = Math.round(Math.random() * 2);
		switch a {
			case 0: return 'revolver';
			case 1: return 'semi-automatic';
			case 2: return 'automatic';	
		}
		return 'automatic';
	}
	function getPayload() {
		var a = Math.floor(Math.random() * 10);
		if (a > 4) {
			return 'dynamite';
		}
		return 'slug';
	}
	function getLauncher() {
		var a = Math.floor(Math.random() * 10);
		if (a > 4) {
			return 'handgun';
		}
		return 'launcher';
	}
	
	public function explode() {
		this.kill();
	}
	
}