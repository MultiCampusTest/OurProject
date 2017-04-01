package java.dao.imagedao;

import java.vo.ImageVo;

public interface IImageDao {
   public int insertImage(ImageVo imageVo);

   public int updateImage(ImageVo imageVo);

   public int deleteImage(int img_idx);

}
