package tm.matching.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.matching.service.MatchingService;
import tm.matching.vo.MatchingVo;
import tm.message.vo.MessageVo;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
//	@RequestMapping("matchingList.do")
//	public ModelAndView matchingList(String mch_g_userid){
//		String black="black";
//		ModelAndView mav=new ModelAndView();
//		mav.addAllObjects(matchingService.matchingList(black));
//		mav.setViewName("member/my_page");
//		return mav;
//	}
	
	 @RequestMapping(value="matchingSuccess.do", method=RequestMethod.POST)
	   public @ResponseBody HashMap<String, Object> matchingSuccess(HttpSession session, int b_idx, String mch_g_userid){
		 System.out.println("야");
	      String mch_t_userid=(String)session.getAttribute("userid");
	      boolean result=matchingService.matchingModify(b_idx, mch_g_userid, 1);
	      if(result==true){
	    		 return matchingService.matchingList(mch_t_userid);
	      }
	      else
	         return matchingService.matchingList(mch_t_userid);
	      
	   }
	 
	 
	 @RequestMapping(value="matchingReject.do",  method=RequestMethod.POST)
	 public @ResponseBody HashMap<String, Object> matchingReject(HttpSession session, int b_idx, String mch_g_userid){
		 System.out.println("여기 오니");
		 String mch_t_userid=(String)session.getAttribute("userid");
	      HashMap<String, Object> params=new HashMap<>();
	      boolean result=matchingService.matchingModify(b_idx, mch_g_userid, 2);
	      params.put("mch_List_Reload", matchingService.matchingList(mch_t_userid));
	      if(result==true){
	    		 return params;
	      }
	      else
	         return params;
	 }
	 


}
