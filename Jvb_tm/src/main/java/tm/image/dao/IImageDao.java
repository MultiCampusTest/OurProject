package tm.image.dao;

import tm.commons.vo.ImageVo;

public interface IImageDao {
	
	public int insertImage(ImageVo imageVo);
	public int updateImage(ImageVo imageVo);
	public int deleteImageTravel(int img_idx);
	public ImageVo selectImageOne(int b_idx);
}
