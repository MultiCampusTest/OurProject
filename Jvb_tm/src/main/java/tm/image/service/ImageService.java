package tm.image.service;

import java.util.List;

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
	
	public List<ImageVo> selectView(int img_code){
		List<ImageVo> list = imageDao.selectImageView(img_code);
		return list;
	}
	
	public ImageVo selectOnce(int img_idx){
		ImageVo image = imageDao.selectImageOnce(img_idx);
		return image;
	}
}
