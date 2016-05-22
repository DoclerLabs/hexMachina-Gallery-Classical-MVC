package example.module.gallery.view;

import example.module.gallery.vo.PhotoVO;
import flash.display.Loader;
import flash.display.Sprite;
import flash.net.URLRequest;
import hex.view.BasicView;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryViewFlash extends BasicView implements IGalleryView
{
	var _layout : Sprite;
	
	public function new( layout : Sprite ) 
	{
		super();
		this._layout = layout;
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void
	{
		for ( photo in photos)
		{
			var loader = new Loader();
			loader.load( new URLRequest( photo.url ) );
			this._layout.addChild( loader );
		}
	}
}