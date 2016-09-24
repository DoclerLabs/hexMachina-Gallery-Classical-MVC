default: js flash

install:
	haxelib newrepo && haxelib install ./build/build.hxml
js:
	haxe ./build/build.hxml -debug -js ./bin/js/Main.js

flash:
	haxe ./build/build.hxml -D advanced-telemetry -debug -swf-header 1024:768:61:900000 -swf bin/swf/index.swf