default: js flash

install:
	haxelib newrepo && haxelib install ./build/build.hxml
js:
	haxe ./build/build-js.hxml 

flash:
	haxe ./build/build-flash.hxml 