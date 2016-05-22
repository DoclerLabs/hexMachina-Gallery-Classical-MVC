package example;

import hex.compiler.parser.xml.XmlCompiler;

/**
 * ...
 * @author duke
 */
@:expose( "FlickrExample" )
class FlickrExample
{
	static var self : FlickrExample;

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
		#end

		self = new FlickrExample();
	}
	
	public function new()
	{
		XmlCompiler.readXmlFile( "example/configuration/context.xml" );
	}
}