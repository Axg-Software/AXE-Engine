package; // Kinda just replace this wit the model you want to use

import away3d.entities.Mesh;
import away3d.events.Asset3DEvent;
import away3d.library.assets.Asset3DType;
import away3d.lights.DirectionalLight;
import away3d.loaders.Loader3D;
import away3d.loaders.misc.AssetLoaderContext;
import away3d.loaders.parsers.OBJParser;
import away3d.materials.TextureMaterial;
import away3d.materials.lightpickers.StaticLightPicker;
import away3d.utils.Cast;
import flixel.FlxG;
import flx3D.FlxView3D;
import openfl.utils.Assets;

class Flixel extends FlxView3D
{
	// Mesh
	var meshs:Array<Mesh> = [];
	var material:TextureMaterial;

	// Lighting
	var light:DirectionalLight;
	var lightPicker:StaticLightPicker;

	// Loading
	private var _loader:Loader3D;
	private var assetLoaderContext:AssetLoaderContext = new AssetLoaderContext();

	public function new(x:Float = 0, y:Float = 0, width:Int = -1, height:Int = -1)
	{
		super(x, y, width, height);

		antialiasing = true;

		light = new DirectionalLight();
		light.ambient = 0.5;
		light.z -= 10;

		view.scene.addChild(light);

		lightPicker = new StaticLightPicker([light]);

		material = new TextureMaterial(Cast.bitmapTexture("assets/test3d/Flixel Color.png"));
		material.lightPicker = lightPicker;

		var __flixelModel = Assets.getBytes("assets/test3d/flixel.obj");
		assetLoaderContext.mapUrlToData("flixel.mtl", Assets.getBytes("assets/test3d/flixel.mtl"));

		_loader = new Loader3D();
		_loader.loadData(__flixelModel, assetLoaderContext, null, new OBJParser());
		_loader.addEventListener(Asset3DEvent.ASSET_COMPLETE, onAssetDone);
		view.scene.addChild(_loader);
	}

	public function onAssetDone(event:Asset3DEvent)
	{
		if (event.asset.assetType == Asset3DType.MESH)
		{
			var mesh:Mesh = cast(event.asset, Mesh);
			mesh.rotationX = -90;
			mesh.scale(6);

			mesh.material = material;

			meshs.push(mesh);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		for (mesh in meshs)
		{
			if (mesh != null)
			{
				if (FlxG.keys.pressed.A)
				{
					mesh.moveLeft(1);
				}
				else if (FlxG.keys.pressed.D)
				{
					mesh.moveRight(1);
				}

				if (FlxG.keys.pressed.W)
				{
					mesh.moveDown(1);
				}
				else if (FlxG.keys.pressed.S)
				{
					mesh.moveUp(1);
				}
			}
		}
	}

	override function destroy()
	{
		super.destroy();
	}
}
