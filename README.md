# hexMachina-Gallery-Classical-MVC
Example application for hexMachina framework of a Flickr gallery

*Find more information about hexMachina on [hexmachina.org](http://hexmachina.org/)*

## Install
0. [install Haxe](http://haxe.org/download/) minimum support Haxe 3.4
1. download or clone git project `git clone https://github.com/DoclerLabs/hexMachina-Gallery-Classical-MVC.git`
2. in folder `cd hexMachina-Gallery-Classical-MVC`
3. install hexMachina framework with haxelib, locally in .haxelib folder `haxelib newrepo && haxelib install ./build/build.hxml` or use Makefile ```make install```

## Target JavaScript
```haxe build/build.hxml -debug -js bin/js/Main.js```
or use Makefile ```make js```

## Target Flash
```haxe build/build.hxml -D advanced-telemetry -debug -swf-header 1024:768:61:900000 -swf bin/swf/index.swf```
or use Makefile ```make flash```
