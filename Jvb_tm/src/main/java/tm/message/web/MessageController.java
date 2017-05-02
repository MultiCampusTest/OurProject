package tm.message.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.message.service.IMessageService;

@Controller
public class MessageController {
	
	@Autowired
	private IMessageService messageService;
	
	@RequestMapping("messageList.do")
	public ModelAndView messageList(String msg_receive_userid, String msg_send_userid){
		String black="black";
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(messageService.messageList(black));
//		mav.addAllObjects(messageService.messageOneList(black, msg_send_userid));
		mav.setViewName("myPage");
		return mav;
	}
	
	@RequestMapping("messageOneList.do")
	public ModelAndView messageOneList(String msg_receive_userid, String msg_send_userid){
		System.out.println("dhkT");
		String black="black";
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(messageService.messageOneList(black, msg_send_userid));
		mav.setViewName("myPage");
		return mav;
	}
	
}
