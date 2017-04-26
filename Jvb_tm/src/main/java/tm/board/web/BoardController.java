package tm.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("main.do")
	public String main(){
		return "middle";
	}
	
	@RequestMapping("myPage.do")
	public String maindo(){
		return "myPage";
	}
	
   @RequestMapping("noticeList.do")
   public String noticeList(){
	   return "noticeList";
   }
   
   @RequestMapping("noticeView.do")
   public String noticeView(){
	   return "noticeView";
   }
   
   @RequestMapping("noticeWriteForm.do")
   public String noticeWriteForm(){
	   return "noticeWriteForm";
   }
   
   @RequestMapping("noticeUpdateForm.do")
   public String noticeUpdateForm(){
	   return "noticeUpdateForm";
   }
   
   @RequestMapping("travelList.do")
   public String travelList(){
	   return "travelList";
   }
   
   @RequestMapping("guideWriteForm.do")
   public String guideWriteForm(){
	   return "guideWriteForm";
   }
   
   @RequestMapping("travelWriteForm.do")
   public String travelWriteForm(){
	   return "travelWriteForm";
   }
   
   @RequestMapping("reviewWriteForm.do")
   public String reviewWriteForm(){
	   return "reviewWriteForm";
   }
}
