package tm.message.service;

import java.util.HashMap;
import java.util.List;

import tm.message.vo.MessageVo;

public interface IMessageService {
	
	public boolean sendMessage(MessageVo messageVo);
	public boolean updateReadMessage(String msg_receive_userid, String msg_send_userid);
	public boolean deleteMessage(String msg_receive_userid);
	public HashMap<String, Object> messageList(String msg_receive_userid);
	public List<MessageVo> messageOneList(String msg_receive_userid, String msg_send_userid);
	public int messageNotReadCount(String msg_receive_userid);
	
	
}