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
import tm.member.vo.MemberVo;

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
	
	//마이페이지
	@RequestMapping("myPage.do")
	public String maindo() {
		return "member/my_page";
	}

	//로그인 유효성 검사 요청
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

	//로그아웃 요청
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("userid");
		return "redirect:main.do";
	}

	
	//회원추가 요청
	@RequestMapping(method=RequestMethod.POST, value="join.do")
	public String join(MemberVo memberVo) {
		memberService.memberJoin(memberVo);
		return "redirect:main.do";
	}
	
	
}
