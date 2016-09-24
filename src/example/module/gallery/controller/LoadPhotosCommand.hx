package example.module.gallery.controller;

import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.IInjectorContainer;
import hex.service.stateless.IAsyncStatelessService;
import hex.service.stateless.IAsyncStatelessServiceListener;

/**
 * ...
 * @author Andrei Bunulu
 */
class LoadPhotosCommand extends BasicCommand implements IAsyncStatelessServiceListener
{
	@Inject
	public var photosService : IGetPhotosService;
	
	@Inject
	public var galleryModel : IGalleryModel;

	function new()
	{
		super();
	}
	
	public function execute(?request:Request):Void 
	{
		#if debug
		getLogger().debug( "LoadPhotosCommand execute" );
		#end
		
		photosService.addListener( this );
		photosService.call();
	}
	
	public function onServiceComplete( service : IAsyncStatelessService ) : Void
	{
		galleryModel.setPhotos( photosService.getPhotos() );
	}
	
	public function onServiceFail( service : IAsyncStatelessService ) : Void
	{
		getLogger().error( "onServiceFail" );
	}
	public function onServiceCancel( service : IAsyncStatelessService ) : Void
	{
		getLogger().warn( "onServiceCancel" );
	}
	public function onServiceTimeout( service : IAsyncStatelessService ) : Void
	{
		getLogger().warn( "onServiceTimeout" );
	}
}