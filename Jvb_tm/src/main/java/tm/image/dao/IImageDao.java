package tm.image.dao;

import java.util.HashMap;
import java.util.List;

import tm.image.vo.ImageVo;

public interface IImageDao {

   public int insertImage(ImageVo imageVo);
   
   public int insertUrl(HashMap<String, Object> params);

   public int updateProfileImage(ImageVo imageVo);

   public int deleteImageTravel(int img_idx);

   public ImageVo selectImageOne(String img_code);

   public List<ImageVo> selectImageView(int img_code);

   public ImageVo selectImageOnce(int img_idx);
   
   public ImageVo selectProfileImageOne(String img_code);
   
   public int deleteByImageCode(String img_code);
   
   public int deleteByImageIdx(String img_idx);
   
   public int updateReviewImage(ImageVo imageVo);
   
   

}