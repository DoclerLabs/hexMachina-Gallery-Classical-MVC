package example;

import hex.compiler.parser.xml.XmlCompiler;
import hex.domain.TopLevelDomain;
import hex.log.LogManager;
import hex.log.DomainLoggerContext;
import hex.log.TraceEverythingDomainConfiguration;

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
		LogManager.context = new DomainLoggerContext(TopLevelDomain.DOMAIN);
		DomainLoggerContext.getContext().setConfiguration(new TraceEverythingDomainConfiguration());
		self = new Main();
		#end
	}
	
	public function new()
	{
		XmlCompiler.compile( "example/configuration/context.xml" );
	}
}