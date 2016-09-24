package js.example.module.gallery.view;

import example.module.gallery.vo.PhotoVO;
import example.module.gallery.view.IGalleryView;
import hex.view.BasicView;
import js.html.Element;
import js.html.Image;
import js.html.ImageElement;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryView extends BasicView implements IGalleryView
{
	var _layout : Element;
	
	public function new( layout : Element ) 
	{
		super();
		this._layout = layout;
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void
	{
		trace("setPhotos");
		for ( photo in photos)
		{
			var img : ImageElement = new Image();
			img.src = photo.url;
			img.alt = photo.name;
			
			this._layout.appendChild( img );
		}
	}
}