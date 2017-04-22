package tm.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("main.do")
	public String main(){
		return "layout.tiles";
	}
	
	@RequestMapping("myPage.do")
	public String maindo(){
		return "myPage";
	}
}
