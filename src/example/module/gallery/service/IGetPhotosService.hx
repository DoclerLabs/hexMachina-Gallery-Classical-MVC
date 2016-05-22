package example.module.gallery.service;

import example.module.gallery.vo.PhotoVO;
import hex.service.stateless.IAsyncStatelessService;

/**
 * @author Andrei Bunulu
 */
interface IGetPhotosService extends IAsyncStatelessService
{
  function getPhotos() : Array<PhotoVO>;
}