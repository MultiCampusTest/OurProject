package tm.member.web;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import tm.image.service.ImageService;
import tm.image.vo.ImageVo;
import tm.matching.service.MatchingService;
import tm.member.service.MemberService;
import tm.member.vo.EmailVo;
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
	 
	@Autowired
	private ImageService imageService;
	
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "member/login_form";
	}
	
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "member/join_form";
	}
	
	@RequestMapping("certiForm.do")
	public String certifiForm() {
		return "member/certi_form";
	}
	
	@RequestMapping("findPassword")
	public String findPassword() {
		return "member/find_password";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="fbJoinForm.do")
	public ModelAndView fbJoinForm(MemberVo memberVo, ImageVo imageVo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("external", memberVo);
		mav.addObject("extImage", imageVo);
		mav.setViewName("member/join_form");
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="naverLogin.do")
	public ModelAndView naverLogin(HttpSession session, String id, String nickname, String email, String sex, String birthday, String name){
		ModelAndView mav = new ModelAndView();
		
		//파라미터값을 모델에 셋팅
		MemberVo memberVo = new MemberVo();
		memberVo.setUserid(email);
		memberVo.setFirstName(name);
		memberVo.setBirthday(birthday);
		//네이버는 연령 이메일 별명 생일 
		mav.addObject("external", memberVo);
		mav.setViewName("member/join_form");
		return mav;
	}
	@RequestMapping("joinResult.do")
	public String joinResult() {
		return "member/join_result";
	}
	
	@RequestMapping("myPage.do")
	public ModelAndView maindo(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		System.out.println(session.getAttribute("userid"));
		HashMap<String, Object> params=new HashMap<>();
		params.put("userid", userid);
		ModelAndView mav=new ModelAndView();
		mav.addObject("userImage", imageService.selectOne(userid));
		mav.addAllObjects(memberService.memberSelectOne(userid));
		mav.addAllObjects(messageService.messageList(userid));
		mav.addAllObjects(matchingService.matchingList(userid));
		mav.addAllObjects(params);
		mav.setViewName("member/my_page");
		return mav;
		
	}
	
	
	
	@RequestMapping(value="updateMember.do", method=RequestMethod.POST)
	public String updateMember(HttpSession session, MemberVo memberVo, MultipartHttpServletRequest req){
		String userid=(String)session.getAttribute("userid");
		memberVo.setUserid(userid);
		boolean result=memberService.memberModify(memberVo, userid, req);
		if(result==true){
			return "redirect:myPage.do";			
		}
		else{
			return "redirect:myPage.do";
		}
	}
	
	@RequestMapping("loginRequest.do")
	public String loginRequest(){
		return "member/login_request";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="loginProc.do")
	public String loginProc(HttpSession session, String userid, String pwd) {
		if(memberService.checkLogin(userid, pwd)) {
			session.setAttribute("userid", userid);
			return "redirect:main.do";
		} else {
			return "redirect:loginForm.do";			
		}
	}
//		if(userid.equals("admin")){
//			session.setAttribute("userid", userid);
//			return "redirect:main.do";
//		}else{
//			return "redirect:loginForm.do";
//		}
//	}

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
	@RequestMapping(method=RequestMethod.POST, value="joinProc.do")
	public ModelAndView joinProc(MemberVo memberVo, MultipartHttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberService.memberJoin(memberVo);
		ImageVo imageVo = new ImageVo();
		imageService.insertImg(imageVo, memberVo.getUserid(), req);
		mav.addObject("f_name", memberVo.getFirstName());
		mav.setViewName("member/join_result");
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
	
	//비밀번호 초기화 + 메일발송
	@RequestMapping("getPassword.do")
	public ModelAndView getPassword(String userid) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVo m = new MemberVo();
		EmailVo email = new EmailVo();
		m.setUserid(userid);
		m.setPwd(Integer.toString((int)(Math.random() * 999999999) + 1000000000));
		
		if(memberService.searchPassword(m)) {
			email.setReciver(userid);
			email.setSubject("[Travel Maker] Forgot your password?");
			email.setContent("New password : " + m.getPwd());
			memberService.sendEmail(email);
			mav.addObject("receiver", m.getUserid());
	        mav.setViewName("member/find_result");
		} else {
			mav.setViewName("redirect:getPassword.do");
		}
		return mav;
	}
}
