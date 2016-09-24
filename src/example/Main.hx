package example;

import hex.compiler.parser.xml.XmlCompiler;

/**
 * ...
 * @author duke
 */
@:expose( "FlickrExample" )
class Main
{
	static var self : Main;

	static public function main() : Void
	{
		#if debug
		var proxy = new hex.log.layout.LogProxyLayout();
		#if js
		var controller = new hex.log.layout.LogLayoutHTMLView( proxy );
		proxy.addListener( new hex.log.layout.SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
		#elseif flash
		proxy.addListener( new hex.log.layout.TraceLayout() );
		#end
		self = new Main();
		#end
	}
	
	public function new()
	{
		XmlCompiler.readXmlFile( "example/configuration/context.xml" );
	}
}