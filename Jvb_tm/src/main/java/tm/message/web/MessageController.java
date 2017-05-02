package tm.message.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.message.service.IMessageService;
import tm.message.vo.MessageVo;

@Controller
public class MessageController {
	
	@Autowired
	private IMessageService messageService;
	
	@RequestMapping("messageList.do")
	public ModelAndView messageList(String msg_receive_userid){
		String black="black";
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(messageService.messageList(black));
		mav.setViewName("member/my_page");
		return mav;
	}
	
	@RequestMapping("messageOneList.do")
	public @ResponseBody List<MessageVo> messageOneList(String msg_receive_userid, String msg_send_userid){
//		System.out.println(msg_receive_userid);
//		System.out.println(msg_send_userid);
		return messageService.messageOneList(msg_receive_userid, msg_send_userid);
	}
	
	@RequestMapping("sendMessage.do")
	public @ResponseBody List<MessageVo> writeMessage(String msg_receive_userid, String msg_send_userid, String msg_contents){
		MessageVo messageVo=new MessageVo();
		messageVo.setMsg_receive_userid(msg_receive_userid);
		messageVo.setMsg_send_userid(msg_send_userid);
		messageVo.setMsg_contents(msg_contents);
		messageService.sendMessage(messageVo);
		
		return messageOneList(msg_receive_userid, msg_contents);
	}
	
}