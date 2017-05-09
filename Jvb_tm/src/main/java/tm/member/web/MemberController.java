package tm.member.web;
 
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.matching.service.MatchingService;
import tm.member.service.MemberService;
import tm.member.vo.MemberVo;
import tm.message.service.MessageService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private MatchingService matchingService;
	
	//로그인 페이지  
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "member/login_form";
	}
	
	//회원가입 페이지
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "member/join_form";
	}
	
	//가입완료 페이지
	@RequestMapping("joinSuccess.do")
	public String joinSuccess() {
		return "member/join_success";
	}
	
	//마이페이지
	@RequestMapping("myPage.do")
	public ModelAndView maindo(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		System.out.println(session.getAttribute("userid"));
		HashMap<String, Object> params=new HashMap<>();
		params.put("userid", userid);
		ModelAndView mav=new ModelAndView();
		mav.addObject("member", memberService.memberSelectOne(userid));
		mav.addAllObjects(messageService.messageList(userid));
		mav.addAllObjects(matchingService.matchingList(userid));
		mav.addAllObjects(params);
		mav.setViewName("member/my_page");
		System.out.println(memberService.memberSelectOne(userid).getFirstName());
		System.out.println(memberService.memberSelectOne(userid).getLastName());
		return mav;
	}
	
	//로그인 요청 페이지
	@RequestMapping("loginRequest.do")
	public String loginRequest(){
		return "member/login_request";
	}
	
	//로그인 유효성 검사 요청
	@RequestMapping(method=RequestMethod.POST, value="login.do")
	public String login(HttpSession session, String userid, String pwd) {
//		if(memberService.checkLogin(userid, pwd)) {
//			session.setAttribute("userid", userid);
//			return "redirect:main.do";
//		} else {
//			return "redirect:loginForm.do";			
//		}
		if(userid.equals("admin")){
			session.setAttribute("userid", userid);
			return "redirect:main.do";
		}else{
			return "redirect:loginForm.do";
		}
	}

	//로그아웃 요청
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("userid");
		return "redirect:main.do";
	}

	//ID 중복체크 요청
	@RequestMapping(method=RequestMethod.POST, value="idCheck.do")
	public @ResponseBody HashMap<String, Object> idCheck(HttpServletResponse resp, String userid) {
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", memberService.checkId(userid));
		System.out.println(response.get("result"));
		return response;
	}
	
	//회원가입 요청
	@RequestMapping(method=RequestMethod.POST, value="join.do")
	public ModelAndView join(MemberVo memberVo) {
		ModelAndView mav = new ModelAndView();
		memberService.memberJoin(memberVo);
		mav.addObject("f_name", memberVo.getFirstName());
		mav.setViewName("member/join_success");
		return mav;
	}
	
	//회원탈퇴 요청
	@RequestMapping("removeMember.do")
	public String removeMember(HttpSession session, MemberVo memberVo){
		if(memberService.memberRemove(memberVo)) {
			session.removeAttribute("userid");			
			return "redirect:main.do";
		} else {
			return "redirect:myPage.do";
		}
	}
}
