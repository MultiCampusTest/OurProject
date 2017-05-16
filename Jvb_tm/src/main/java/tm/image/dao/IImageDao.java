package tm.image.dao;

import java.util.List;

import tm.image.vo.ImageVo;

public interface IImageDao {

   public int insertImage(ImageVo imageVo);

   public int updateImage(ImageVo imageVo);

   public int deleteImageTravel(int img_idx);

   public ImageVo selectImageOne(String img_code);

   public List<ImageVo> selectImageView(int img_code);

   public ImageVo selectImageOnce(int img_idx);
   
   public ImageVo selectProfileImageOne(String img_code);
   
   
   
}