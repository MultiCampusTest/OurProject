package tm.message.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.message.service.IMessageService;
import tm.message.vo.MessageVo;

@Controller
public class MessageController {
	
	@Autowired
	private IMessageService messageService;
	
//	@RequestMapping("messageList.do")
//	public ModelAndView messageList(String msg_receive_userid){
//		String black="black";
//		ModelAndView mav=new ModelAndView();
//		mav.addAllObjects(messageService.messageList(black));
//		mav.setViewName("member/my_page");
//		return mav;
//	}
	
	
	
	@RequestMapping("message.do")
	public ModelAndView message(HttpSession session){
		String userid = (String) session.getAttribute("userid");
		System.out.println(session.getAttribute("userid"));
		
		String url="message";
		HashMap<String, Object> params=new HashMap<>();
		params.put("userid", userid);
		params.put("url", url);
		
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(messageService.messageList(userid));
		mav.addAllObjects(params);
		mav.setViewName("member/my_page");
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="messageOneList.do", method=RequestMethod.POST)
	public @ResponseBody List<MessageVo> messageOneList(HttpSession session, String msg_send_userid){
		String msg_receive_userid=(String)session.getAttribute("userid");
		System.out.println(msg_receive_userid);
		System.out.println(msg_send_userid);
		return messageService.messageOneList(msg_receive_userid, msg_send_userid);
	}
	
	
//	@RequestMapping(value="moreMessageList.do", method=RequestMethod.POST)
//	public @ResponseBody HashMap<String, Object> moreMessageList(HttpSession session, int count){
//		System.out.println("더 보기까지 오느냐");
//		String msg_receive_userid=(String)session.getAttribute("userid");
//		return messageService.messageList(msg_receive_userid);
//	}
	
	
	@RequestMapping("sendMessage.do")
	public @ResponseBody List<MessageVo> writeMessage(HttpSession session, String msg_send_userid, String msg_contents){
		String msg_receive_userid=(String)session.getAttribute("userid");
		MessageVo messageVo=new MessageVo();
		messageVo.setMsg_receive_userid(msg_send_userid);
		messageVo.setMsg_send_userid(msg_receive_userid);
		messageVo.setMsg_contents(msg_contents);
		messageService.sendMessage(messageVo);
		
		return messageService.messageOneList(msg_receive_userid, msg_send_userid);
		
	}
	
	@RequestMapping("sendMessageAtGuide.do")
	public String sendMessageAtGuide(HttpSession session, String msg_receive_userid, String msg_contents, int boardIdx){
		String msg_send_userid=(String)session.getAttribute("userid");
		MessageVo messageVo=new MessageVo();
		messageVo.setMsg_receive_userid(msg_receive_userid);
		messageVo.setMsg_send_userid(msg_send_userid);
		messageVo.setMsg_contents(msg_contents);
		messageService.sendMessage(messageVo);
		return "redirect:guideView.do?boardIdx="+boardIdx;
	}
	
	
	
//	  @InitBinder
//	   public void initBinder(WebDataBinder binder){
//	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//	      binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
//	   }
	
	
}