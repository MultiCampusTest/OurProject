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

import tm.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	 
	//로그인 유효성 검사
	@RequestMapping("login.do")
	public String loginF(HttpSession session, String userid, String pwd)
	{
		if(memberService.checkValidation(userid, pwd))
		{
			System.out.println(userid);
			System.out.println(pwd);
			session.setAttribute("userid", userid);
		}
		return "redirect:main.do";
	}

	
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "loginForm";
	}
	
	//회원가입 화면 요청
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "joinForm";
	}
	
	//비밀번호 찾기 화면
	@RequestMapping("searchPassword")
	public String searchPassword(){
		return "searchPassword";
	}
	
}