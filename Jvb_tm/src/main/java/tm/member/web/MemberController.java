package tm.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	//회원가입 화면 요청
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "joinForm";
	}
	
	//로그인 화면 요청
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "loginForm";
	}
}
