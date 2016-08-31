default: js flash

js:
	haxelib install ./build/build.hxml
	haxe ./build/build.hxml -debug -js ./bin/js/Main.js

flash:
	haxelib install ./build/build.hxml
	haxe ./build/build.hxml -D advanced-telemetry -debug -swf-header 1024:768:61:900000 -swf bin/swf/index.swf