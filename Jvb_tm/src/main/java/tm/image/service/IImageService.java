package tm.image.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.board.vo.BoardVo;
import tm.image.vo.ImageVo;

public interface IImageService {

   public void insertImg(ImageVo imageVo, String img_code, MultipartHttpServletRequest req);
   public void insertUrl(HashMap<String, Object> params);
   

   public boolean deleteImg(int img_idx);

   public void updateImg(ImageVo imageVo, String img_code, MultipartHttpServletRequest req);

   public ImageVo selectOne(String img_code);

   public List<ImageVo> selectView(int img_idx);

   public ImageVo selectOnce(int img_idx);
   
   public ImageVo selectProfileOne(String img_code);
   
   //review관련
   public void insertReviewImg(BoardVo board, MultipartHttpServletRequest req);
   public void updateReviewImg(BoardVo board, MultipartHttpServletRequest req, String[] img_idx);
   public void deleteReviewImg(String img_code, MultipartHttpServletRequest req, String[] img_idx);
   public void deleteReview(String img_code);
   public ImageVo insertImage(MultipartFile file);

}
