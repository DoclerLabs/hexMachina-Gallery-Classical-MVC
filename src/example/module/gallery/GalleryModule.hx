package example.module.gallery;

import example.module.gallery.controller.LoadPhotosCommand;
import example.module.gallery.message.GalleryModuleMessage;
import example.module.gallery.model.GalleryModel;
import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.view.GalleryViewHelper;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import example.module.gallery.view.IGalleryView;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModule extends Module implements IGalleryModule
{
	public function new( serviceConfig : IStatefulConfig, view : IGalleryView ) 
	{
		super();
		
		this.getLogger().info( "GalleryModule initialized" );

		this._addStatefulConfigs( [ serviceConfig ] );
		this._addStatelessConfigClasses( [ GalleryCommandConfig, GalleryModelConfig ] );
		this.buildViewHelper( GalleryViewHelper, view);
		
		this._dispatchPrivateMessage( GalleryModuleMessage.LOAD_PHOTOS ); 
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		rd.addMappedDependencies( [ { type: IGetPhotosService, name: '' } ] );
		return rd;
	}
}

private class GalleryCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( GalleryModuleMessage.LOAD_PHOTOS, LoadPhotosCommand );
	}
}

private class GalleryModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.map( IGalleryModel, GalleryModel );
	}
}