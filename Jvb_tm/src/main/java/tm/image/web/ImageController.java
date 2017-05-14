package tm.image.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tm.image.service.ImageService;
import tm.image.vo.ImageVo;

@Controller
public class ImageController {

	@Autowired
	private ImageService imageService;
	
	@RequestMapping(value="imageShow.do", method={RequestMethod.GET})
	public void imageShow(String img_code, HttpServletResponse req) throws IOException{
		System.out.println(img_code);
		ImageVo image = imageService.selectOne(img_code);
		
		  req.setContentType("images/jpg; utf-8");
	      String originFile = (String)image.getImg_ori_name();
	      String filename = new String(originFile.getBytes("UTF-8"),"ISO-8859-1");
	      req.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\";");
	      req.setHeader("Content-Transfer-Encoding", "binary");
	      
	      OutputStream outputStream = req.getOutputStream();
	   
	      File file = new File((String)image.getImg_path());
	   
	      FileInputStream inputStream = new FileInputStream(file);
	   
	      IOUtils.copy(inputStream, outputStream);
	   
	      outputStream.flush();
	      outputStream.close();
	}
}
