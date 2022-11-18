package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.util.FlxColor;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;

class Main extends Sprite
{
	public static var instance:Main;

	var gameWidth:Int = 960; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 720; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.

	public static function main():Void
	{
		Lib.current.addChild(new Main());
	}

	public function new()
	{
		super();

		instance = this;

		if (stage != null)
		{
			init();
		}
		else
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(?E:Event):Void
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}

		setupGame();
	}

	var game:FlxGame;

	public var underlay:Bitmap;

	/*public var edgeLeft:Bitmap;
		public var edgeRight:Bitmap;
		public var edgeTop:Bitmap;
		public var edgeBottom:Bitmap; */
	private function setupGame():Void
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (zoom == -1)
		{
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}

		var black = new BitmapData(1, 1, true, FlxColor.BLACK);

		// To hide the 3D renderers
		underlay = new Bitmap(black);
		addChild(underlay);

		game = new FlxGame(gameWidth, gameHeight, PlayState);
		addChild(game);

		// To hide the edges
		/*edgeLeft = new Bitmap(black);
			addChild(edgeLeft);
			edgeRight = new Bitmap(black);
			addChild(edgeRight);
			edgeTop = new Bitmap(black);
			addChild(edgeTop);
			edgeBottom = new Bitmap(black);
			addChild(edgeBottom); */

		stage.addEventListener(Event.RESIZE, onResize);

		onResize();
	}

	function onResize(event:Event = null)
	{
		var width = stage.stageWidth;
		var height = stage.stageHeight;
		underlay.scaleX = stage.stageWidth;
		underlay.scaleY = stage.stageHeight;

		@:privateAccess {
			FlxG.width = FlxG.initialWidth;
			FlxG.height = FlxG.initialHeight;
		}

		var gameSize = new FlxPoint(width, height);

		var ratio:Float = FlxG.width / FlxG.height;
		var realRatio:Float = width / height;

		var scaledY:Bool = realRatio < ratio;

		if (scaledY)
		{
			gameSize.x = width;
			gameSize.y = Math.ceil(gameSize.x / ratio);
		}
		else
		{
			gameSize.y = height;
			gameSize.x = Math.ceil(gameSize.y * ratio);
		}

		// var scaleX = gameSize.x / (FlxG.width * FlxG.initialZoom);
		// var scaleY = gameSize.y / (FlxG.height * FlxG.initialZoom);

		FlxG.game.x = Math.ceil((width - gameSize.x) * 0.5);
		FlxG.game.y = Math.ceil((height - gameSize.y) * 0.5);
	}
}
