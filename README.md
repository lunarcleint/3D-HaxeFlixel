# 3D-HaxeFlixel

 [![](https://raw.github.com/HaxeFlixel/haxeflixel.com/master/src/files/images/flixel-logos/HaxeFlixel.png)](http://haxeflixel.com/)
 
### TUTORIAL 1 IS OUT‼️:
[![Watch the video](https://img.youtube.com/vi/WwTH71btngs/maxresdefault.jpg)](https://youtu.be/WwTH71btngs)
 
## Credits 🟢
- **Lunarcleint**: Made the tutorial Video + Utils https://twitter.com/lunarcleint
- **Ne_Eo**: Made the Away3D x HaxeFlixel renderer + Testing https://twitter.com/Ne_Eo_Twitch
- **Doggy Dentures**: Made some limitations known, help with Away Builder https://gamebanana.com/members/1790484
 
## Info 🔵
This uses the [Away3D](https://github.com/openfl/away3d) frame work from OpenFL and makes it renderable in [HaxeFlixel](https://github.com/HaxeFlixel/flixel) as a FlxSprite. With some rendering workarounds in the FlxView3D and Main File, this is possible.

[Away3D](https://github.com/openfl/away3d) uses View3D as its primary container so that is what the FlxView3D works with. 

## Limitations 🔴
- Can not render a model with more then **ONE** texture (can have specular and normal maps).
- Only supports the follow file formats; `.obj, .awd, .3ds, .ac3d, .md2, .md5, .dae, .dfx`.
- Amount of View3Ds allowed limited to `FlxG.stage.stage3Ds.length` (preformance dependent in some cases). Use `Flx3DUtil.is3DAvailable();` to check if a 3D Instance is available.

## Requirements 🟡

- The Away3D OpenFL Library; ` openfl install away3d`
- Adding the Library to your Project.xml; `<haxelib name="away3d"/>`
