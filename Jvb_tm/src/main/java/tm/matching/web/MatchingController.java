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

import com.google.gson.Gson;

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
	
	
	
	
	@RequestMapping("guideMatching.do")
	public ModelAndView guideMatching(HttpSession session){
		String userid = (String) session.getAttribute("userid");
		System.out.println(session.getAttribute("userid"));
		
		String url="g_matching";
		HashMap<String, Object> params=new HashMap<>();
		params.put("userid", userid);
		params.put("url", url);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("type", "g_matching");
		mav.addAllObjects(matchingService.matchingList(userid));
		mav.addAllObjects(params);
		mav.setViewName("member/my_page");
		return mav;
	}
	
	@RequestMapping(value="androidMatchingList.do", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> and_matchingList(String userid){
		System.out.println("안드로이드 매칭 리스트");
//		HashMap<String, Object> response=new HashMap<>();
//		Gson gson = new Gson(); 
//		String str = gson.toJson(matchingService.matchingList(userid));
//		response.put("matchingListStr", str);
//		return response;
		return matchingService.matchingList(userid);
	}
	
	
	@RequestMapping("travelMatching.do")
	public ModelAndView travelMatching(HttpSession session){
		String userid = (String) session.getAttribute("userid");
		System.out.println(session.getAttribute("userid"));
		
		String url="t_matching";
		HashMap<String, Object> params=new HashMap<>();
		params.put("userid", userid);
		params.put("url", url);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("type", "t_matching");
		mav.addAllObjects(matchingService.matchingList(userid));
		mav.addAllObjects(params);
		mav.setViewName("member/my_page");
		
		System.out.println(matchingService.matchingList(userid));
		return mav;
	}
	
	
		
	
	
	
	
//	@RequestMapping(value="matchingHolding.do", method=RequestMethod.POST)
//	public @ResponseBody HashMap<String, Object> matchingHolding(HttpSession session, int b_idx, String mch_g_userid){
//		 String mch_t_userid=(String)session.getAttribute("userid");
//	      boolean result=matchingService.matchingModify(b_idx, mch_g_userid, 2);
//	      if(result==true){
//	    		 return matchingService.matchingList(mch_t_userid);
//	      }
//	      else
//	         return matchingService.matchingList(mch_t_userid);
//	}
	
	 @RequestMapping(value="matchingSuccess.do", method=RequestMethod.POST)
	   public @ResponseBody HashMap<String, Object> matchingSuccess(HttpSession session, int b_idx, String mch_g_userid){
		 System.out.println("야");
	      String mch_t_userid=(String)session.getAttribute("userid");
	      matchingService.matchingModify(b_idx, mch_g_userid, 1);
	     
	      return matchingService.matchingList(mch_t_userid);
	      
	   }
	 
	 
	 @RequestMapping(value="matchingReject.do",  method=RequestMethod.POST)
	 public @ResponseBody HashMap<String, Object> matchingReject(HttpSession session, int b_idx, String mch_g_userid){
		 System.out.println("여기 오니");
		 String mch_t_userid=(String)session.getAttribute("userid");
//	      HashMap<String, Object> params=new HashMap<>();
	      matchingService.matchingModify(b_idx, mch_g_userid, 3);
//	      params.put("mch_List_Reload", matchingService.matchingList(mch_t_userid));
	      System.out.println( "외냐");
	      
	     return matchingService.matchingList(mch_t_userid);
	 }
	 


}
