package tm.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tm.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//로그인 페이지
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "loginForm";
	}
	
	//회원가입 페이지
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "joinForm";
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
	
	
	
	
}
