package tm.matching.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.matching.service.MatchingService;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping("matchingList.do")
	public ModelAndView matchingList(String mch_g_userid){
		String black="black";
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(matchingService.matchingList(black));
		mav.setViewName("member/my_page");
		return mav;
	}

}
