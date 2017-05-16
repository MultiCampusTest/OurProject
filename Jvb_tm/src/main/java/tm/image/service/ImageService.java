package tm.image.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.image.dao.IImageDao;
import tm.image.vo.ImageVo;
import tm.member.vo.MemberVo;

@Service
public class ImageService implements IImageService {

   @Autowired
   private IImageDao imageDao;

   @Override
   public void insertImg(ImageVo imageVo, String img_code, MultipartHttpServletRequest req) {
      // int result = imageDao.insertImage(imageVo);

      // if (result > 0) {
      String path = "/Users/KYS/Upload/";
      File folder = new File(path);
      if (!folder.exists()) {
         folder.mkdirs();
      }

      List<MultipartFile> files = req.getFiles("file");

      for (int i = 0; i < files.size(); i++) {
         UUID uuid = UUID.randomUUID();

         String fileName = files.get(i).getOriginalFilename();
         int fileSize = (int) files.get(i).getSize();

         String ext = fileName.substring(fileName.lastIndexOf('.'));
         String fileuri = path + uuid + ext;

//         ImageVo image = new ImageVo();

         imageVo.setImg_ori_name(fileName);
         imageVo.setImg_code(img_code);
         imageVo.setImg_path(fileuri);

         File localFile = new File(fileuri);

         try {
            files.get(i).transferTo(localFile);
         } catch (IllegalStateException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         }
         
         imageDao.insertImage(imageVo);
      }

      // return true;
      // } else {
      // return false;
      // }
   }

   @Override
   public boolean deleteImg(int img_idx) {
      int result = imageDao.deleteImageTravel(img_idx);
      
      if (result > 0) {
         return true;
      } else {
         return false;
      }
   }

   @Override
   public void updateImg(ImageVo imageVo, String img_code, MultipartHttpServletRequest req) {
      String path = "/Users/KYS/Upload/";
      File folder = new File(path);
      if (!folder.exists()) {
         folder.mkdirs();
      }

      List<MultipartFile> files = req.getFiles("file");

      for (int i = 0; i < files.size(); i++) {
         UUID uuid = UUID.randomUUID();

         String fileName = files.get(i).getOriginalFilename();
         int fileSize = (int) files.get(i).getSize();

         String ext = fileName.substring(fileName.lastIndexOf('.'));
         String fileuri = path + uuid + ext;

         imageVo.setImg_ori_name(fileName);
         imageVo.setImg_code(img_code);
         imageVo.setImg_path(fileuri);

         File localFile = new File(fileuri);

         try {
            files.get(i).transferTo(localFile);
         } catch (IllegalStateException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         }
         
         imageDao.updateImage(imageVo);
      }

   }

   @Override
   public ImageVo selectOne(String img_code) {
      ImageVo image = imageDao.selectImageOne(img_code);
      return image;
   }

   @Override
   public List<ImageVo> selectView(int img_idx) {
      List<ImageVo> list = imageDao.selectImageView(img_idx);
      return list;
   }

   @Override
   public ImageVo selectOnce(int img_idx) {
      ImageVo image = imageDao.selectImageOnce(img_idx);
      return image;
   }

   
   
   @Override
   public ImageVo selectProfileOne(String img_code) {
      ImageVo image=imageDao.selectProfileImageOne(img_code);
      return image;
   }
   
   
   
   

}
