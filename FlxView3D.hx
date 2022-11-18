package;

import away3d.events.LoaderEvent;
import away3d.library.assets.IAsset;
import away3d.core.base.Object3D;
import away3d.loaders.Loader3D;
import away3d.loaders.misc.AssetLoaderContext;
import openfl.Lib;
import flixel.FlxG;
import openfl.display.BitmapData;
import away3d.containers.View3D;
import away3d.library.assets.Asset3DType;
import away3d.materials.ColorMaterial;
import away3d.entities.Mesh;
import away3d.events.Asset3DEvent;
import flixel.FlxSprite;

class FlxView3D extends FlxSprite {
	public var view:View3D;

	private var bmp:BitmapData;

	private var _loader:Loader3D;

	public var drawScale:Float = 1;

	public var finishedLoading:Bool = false;

	var assetLoaderContext:AssetLoaderContext = new AssetLoaderContext();

	public function new(x:Float = 0, y:Float = 0, width:Int = -1, height:Int = -1, scale:Float = 1) {
		super(x, y);

		drawScale = scale;

		frameRate = 30;

		view = new View3D();
		view.visible = false;
		Main.instance.addChildAt(view, 0);

		view.width = width == -1 ? FlxG.width : width;
		view.height = height == -1 ? FlxG.height : height;
		view.backgroundAlpha = 0;
		bmp = new BitmapData(Std.int(view.width), Std.int(view.height), true, 0x0);

		loadGraphic(bmp);
	}

	function onResourceComplete(event:LoaderEvent) {
		trace("Resource Complete");
		finishedLoading = true;
	}

	function dispose<T:IAsset>(obj:Null<T>):T {
		if(obj != null) {
			obj.dispose();
		}
		return null;
	}

	override function destroy() {
		Main.instance.removeChild(view);
		view.dispose();
		super.destroy();
		if(bmp != null) {
			bmp.dispose();
			bmp = null;
		}
		view = null;
		assetLoaderContext = null;
	}

	public var renderEveryFrame:Bool = true;
	public var frameRate(default, set):Float;
	function set_frameRate(value:Float) {
		delay = 1/value;
		return frameRate = value;
	}
	public var delay:Float = 0;
	public var drawTimer:Float = 0;

	override function update(elapsed:Float) {
		super.update(elapsed);
		drawTimer += elapsed;
	}

	override function draw() {
		super.draw();

		if(renderEveryFrame || drawTimer > delay) {
			Main.instance.addChildAt(view, 0);
			var old = FlxG.game.filters;
			FlxG.game.filters = null;
			view.renderer.queueSnapshot(bmp);
			view.render();
			drawTimer = 0;
			FlxG.game.filters = old;
			Main.instance.removeChild(view);
		}
	}

	//function onAssetComplete(event:Asset3DEvent)
	//{
		/*if (event.asset.assetType == Asset3DType.MESH)
		{
			var mesh = cast(event.asset, Mesh);
			mesh.material = new ColorMaterial(0xFF00FF);
			mesh.material.lightPicker = _lightPicker;
			mesh.castsShadows = true;
			_mest = mesh;

			mesh.rotationX = -0;
			mesh.rotationY = 0;
			mesh.rotationZ = -25;
			mesh.scale(300);
			view.scene.addChild(mesh);
		}*/
	//}
}