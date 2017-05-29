package tm.image.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.board.vo.BoardVo;
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
      String path = "/Users/LeeGilSun/Upload/";
      File folder = new File(path);
      if (!folder.exists()) {
         folder.mkdirs();
      }

      List<MultipartFile> files = req.getFiles("file");

      for (int i = 0; i < files.size(); i++) {
         UUID uuid = UUID.randomUUID();

         String fileName = files.get(i).getOriginalFilename();
         int fileSize = (int) files.get(i).getSize();

         String fileuri = path + uuid;

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
      String path = "/Users/LeeGilSun/Upload/";
      File folder = new File(path);
      if (!folder.exists()) {
         folder.mkdirs();
      }

      List<MultipartFile> files = req.getFiles("file");

      for (int i = 0; i < files.size(); i++) {
         UUID uuid = UUID.randomUUID();

         String fileName = files.get(i).getOriginalFilename();
         int fileSize = (int) files.get(i).getSize();

//         String ext = fileName.substring(fileName.lastIndexOf('.'));
         String fileuri = path + uuid;

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
         
         if(!fileName.equals("")){
        	 imageDao.updateProfileImage(imageVo);
        	 
         }
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

	@Override
	public void insertReviewImg(BoardVo board, MultipartFile file) {
		// TODO Auto-generated method stub
		String path = "/Users/LeeGilSun/Upload/";
		
        File folder = new File(path);
        if (!folder.exists()) {
        	folder.mkdirs();
        }
        
        UUID uuid = UUID.randomUUID();

        String fileName = file.getOriginalFilename();
        String fileuri = path + uuid;
        
        ImageVo image = new ImageVo();
        image.setImg_ori_name(fileName);
        System.out.println(board.getBoardIdx()+"아이디엑스");
        image.setImg_code(Integer.toString(board.getBoardIdx()));
        image.setImg_path(fileuri);

        File localFile = new File(fileuri);

        try {
           file.transferTo(localFile);
        } catch (IllegalStateException e) {
           e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }
        if(!fileName.equals("")){
        	imageDao.insertImage(image);            	
        }
	}

	@Override
	public void updateReviewImg(BoardVo board, MultipartHttpServletRequest req, String[] img_idx) {
		// TODO Auto-generated method stub
		String path = "/Users/LeeGilSun/Upload/";
		
        File folder = new File(path);
        if (!folder.exists()) {
        	folder.mkdirs();
        }
        
        List<MultipartFile> files = req.getFiles("file");
        
        for (int i = 0; i < files.size(); i++) {
            UUID uuid = UUID.randomUUID();

            String fileName = files.get(i).getOriginalFilename();
            String fileuri = path + uuid;         
            
            ImageVo image = new ImageVo();
            int img_idxInt = Integer.parseInt(img_idx[i]);
            image.setImg_idx(img_idxInt);
            image.setImg_ori_name(fileName);
            image.setImg_code(Integer.toString(board.getBoardIdx()));
            image.setImg_path(fileuri);

            File localFile = new File(fileuri);

            try {
               files.get(i).transferTo(localFile);
            } catch (IllegalStateException e) {
               e.printStackTrace();
            } catch (IOException e) {
               e.printStackTrace();
            }
            
            if(!fileName.equals("")){
            	if(image.getImg_idx() == 0){
            		imageDao.insertImage(image);
            	} else {
            		imageDao.updateReviewImage(image);            	            		
            	}
            }
         }
	}

	@Override
	public void insertUrl(HashMap<String, Object> params) {
		imageDao.insertUrl(params);
	} 
	
	@Override
	public void deleteReviewImg(String img_code, MultipartHttpServletRequest req, String[] img_idx) {
		// TODO Auto-generated method stub
		List<MultipartFile> files = req.getFiles("file");

		for(int i=0; i<files.size(); i++){
			String filename = files.get(i).getOriginalFilename();
			if(!filename.equals("")){
				imageDao.deleteByImageIdx(img_idx[i]);			
			}
		}
	}

	@Override
	public void deleteReview(String img_code) {
		// TODO Auto-generated method stub
		imageDao.deleteByImageCode(img_code);
	}

	@Override
	public ImageVo insertImage(MultipartFile file) {
		// TODO Auto-generated method stub
		String path = "/Users/LeeGilSun/Upload/";
		
        File folder = new File(path);
        if (!folder.exists()) {
        	folder.mkdirs();
        }
        
        UUID uuid = UUID.randomUUID();
        String originName = file.getOriginalFilename();
        String fileuri = path + uuid;
        
        ImageVo image = new ImageVo();
        image.setImg_ori_name(originName);
//        image.setImg_code(Integer.toString(board.getBoardIdx()));
        image.setImg_path(fileuri);
        
        File localFile = new File(fileuri);

        try {
           file.transferTo(localFile);
        } catch (IllegalStateException e) {
           e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }
        
        imageDao.insertImage(image); 
        System.out.println(image.getImg_idx());
        return image;
	} 
   
   
   
   

}