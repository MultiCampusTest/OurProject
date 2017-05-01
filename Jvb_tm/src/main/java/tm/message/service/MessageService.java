package tm.message.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.message.dao.IMessageDao;
import tm.message.vo.MessageVo;

@Service
public class MessageService implements IMessageService {

	@Autowired
	private IMessageDao messageDao;

	@Override
	public void sendMessage(MessageVo messageVo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean deleteMessage(String msg_receive_userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public HashMap<String, Object> messageList(String msg_receive_userid) {
		// TODO Auto-generated method stub
		List<MessageVo> messageByUserid=new ArrayList<>();
		messageByUserid=messageDao.messageSelectByUserid(msg_receive_userid);
		HashMap<String, Object> messageList=new HashMap<>();
		messageList.put("messageList", messageByUserid);
		
		return messageList;
	}

	@Override
	public MessageVo messageOneList(String msg_receive_userid, String msg_send_userid) {
		// TODO Auto-generated method stub
		return null;
	}
}