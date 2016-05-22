package example.module.gallery.view;

import example.module.gallery.vo.PhotoVO;
import hex.view.BasicView;
import js.html.DOMElement;
import js.html.Image;
import js.html.ImageElement;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryViewJS extends BasicView implements IGalleryView
{
	var _layout : DOMElement;
	
	public function new( layout : DOMElement ) 
	{
		super();
		this._layout = layout;
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void
	{
		for ( photo in photos)
		{
			var img : ImageElement = new Image();
			img.src = photo.url;
			img.alt = photo.name;
			
			this._layout.appendChild( img );
		}
	}
}