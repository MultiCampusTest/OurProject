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

import tm.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
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
	
	//myPage
	@RequestMapping("myPage.do")
	public String maindo() {
		return "member/my_page";
	}

	//로그인 유효성 검사
	@RequestMapping(method=RequestMethod.POST, value="login.do")
	public String login(HttpSession session, String userid, String pwd) {
		if(memberService.checkLogin(userid, pwd)) {
			session.setAttribute("userid", userid);
			session.setAttribute("pwd", pwd);
			return "redirect:main.do";
		} else {
			return "redirect:loginForm.do";			
		}
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("userid");
		return "redirect:main.do";
	}
	
	//아이디 중복체크
	@RequestMapping("idCheck.do")
	public @ResponseBody HashMap<String, Object> idCheck(HttpServletResponse resp, String id){
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", memberService.checkId(id));
		return response;
	}
	
	
	
}
