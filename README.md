# 3D-HaxeFlixel

 [![](https://raw.github.com/HaxeFlixel/haxeflixel.com/master/src/files/images/flixel-logos/HaxeFlixel.png)](http://haxeflixel.com/)
 
## Credits 🟢
- **Lunarcleint**: Made the tutorial Video + Some Exaples https://twitter.com/lunarcleint
- **Ne_Eo**: Made the Away3D x HaxeFlixel render https://twitter.com/Ne_Eo_Twitch
- **Nom**: Some Examples https://twitter.com/nomethyDeSecond
 
## Info 🔵
This uses the [Away3D](https://github.com/openfl/away3d) frame work from OpenFL and makes it renderable in [HaxeFlixel](https://github.com/HaxeFlixel/flixel) as a FlxSprite. With some rendering workarounds in the FlxView3D and Main File, this is possible.

[Away3D](https://github.com/openfl/away3d) uses View3D as its primary container so that is what the FlxView3D works with. 

### Limitations 🔴
- Can not render a model with more then **ONE** texture.
- Only supports the follow file formats; `AC3D, Collada, Max3DS, MD2, MD5, OBJ`

## Requirements 🟡

- The Away3D OpenFL Library; ` openfl install away3d`
- Adding the Library to your Project.xml; `<haxelib name="away3d"/>`
