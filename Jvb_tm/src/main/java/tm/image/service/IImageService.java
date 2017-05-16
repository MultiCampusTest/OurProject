package tm.image.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.image.vo.ImageVo;

public interface IImageService {

   public void insertImg(ImageVo imageVo, String img_code, MultipartHttpServletRequest req);

   public boolean deleteImg(int img_idx);

   public void updateImg(ImageVo imageVo, String img_code, MultipartHttpServletRequest req);

   public ImageVo selectOne(String img_code);

   public List<ImageVo> selectView(int img_idx);

   public ImageVo selectOnce(int img_idx);
   
   public ImageVo selectProfileOne(String img_code);
   
   

}
