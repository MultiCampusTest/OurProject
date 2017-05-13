package tm.image.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.image.dao.IImageDao;
import tm.image.vo.ImageVo;

@Service
public class ImageService {

	@Autowired
	private IImageDao imageDao;
	
	public ImageVo selectOne(String img_code){
		ImageVo image = imageDao.selectImageOne(img_code);
		return image;
	}
}
