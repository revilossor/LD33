package entity;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Oliver Ross
 */
class Player extends FlxGroup
{
	var _core:Entity;
	
	public function new() 
	{
		super();
		init();
	}
	function init() {
		add(_core = getCore());
	}
	function getCore() {
		_core = new Entity(184, 400);
		_core.makeGraphic(32, 48, 0xffff00ff);
		return _core;
	}
	
}