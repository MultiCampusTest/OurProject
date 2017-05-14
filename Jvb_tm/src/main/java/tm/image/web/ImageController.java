package tm.image.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tm.image.service.ImageService;
import tm.image.vo.ImageVo;

@Controller
public class ImageController {

	@Autowired
	private ImageService imageService;
	
	//group by를 통해 1개만 가져오기
	@RequestMapping(value="imageShow.do", method={RequestMethod.GET})
	public void imageShow(String img_code, HttpServletResponse resp) throws IOException{
		System.out.println(img_code);
		ImageVo image = imageService.selectOne(img_code);
		
		resp.setContentType("images/jpg; utf-8");
	    String originFile = (String)image.getImg_ori_name();
	    String filename = new String(originFile.getBytes("UTF-8"),"ISO-8859-1");
	    resp.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\";");
	    resp.setHeader("Content-Transfer-Encoding", "binary");
	      
	    OutputStream outputStream = resp.getOutputStream();
	    File file = new File((String)image.getImg_path());
	   
	    FileInputStream inputStream = new FileInputStream(file);
	   
	    IOUtils.copy(inputStream, outputStream);
	   
	    outputStream.flush();
	    outputStream.close();
	}
	
	//img_idx를 통해  가져오기
	@RequestMapping("imageView.do")
	public void imageView(int img_idx, HttpServletResponse resp) throws IOException{
		ImageVo image = imageService.selectOnce(img_idx);
		
		resp.setContentType("images/jpg; utf-8");
	    String originFile = (String)image.getImg_ori_name();
	    String filename = new String(originFile.getBytes("UTF-8"),"ISO-8859-1");
	    resp.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\";");
	    resp.setHeader("Content-Transfer-Encoding", "binary");
	      
	    OutputStream outputStream = resp.getOutputStream();
	    File file = new File((String)image.getImg_path());
	   
	    FileInputStream inputStream = new FileInputStream(file);
	   
	    IOUtils.copy(inputStream, outputStream);
	   
	    outputStream.flush();
	    outputStream.close();
	}
}
