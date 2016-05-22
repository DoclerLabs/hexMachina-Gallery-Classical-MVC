package example.service.flickr;

import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.vo.PhotoVO;
import hex.log.Logger;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author Andrei Bunulu
 */
class FlickrGetPhotos extends HTTPService implements IGetPhotosService
{

	public function new() 
	{
		super();
		
		#if debug
		Logger.DEBUG( "FlickrGetPhotos constructor" );
		#end
	}
	
	@PostConstruct
	override public function createConfiguration() : Void
	{
		#if debug
		Logger.DEBUG( "FlickrGetPhotos createConfiguration" );
		#end
		
		this.setConfiguration( new HTTPServiceConfiguration( "https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=bdeda660a5fcdf79170c711c07156f12&user_id=134406781%40N06&format=json" ) );
		this.setParser( new FlickrPhotosParser() );
	}
	
	public function getPhotos() : Array<PhotoVO> 
	{
		return this._result;
	}
}