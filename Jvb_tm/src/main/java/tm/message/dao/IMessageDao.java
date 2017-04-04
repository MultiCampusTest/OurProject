package tm.message.dao;

import java.util.HashMap;
import java.util.List;
import java.vo.MessageVo;


public interface IMessageDao {
	
	public int insertMessage(MessageVo messageVo);
	public int deleteMessage(int msg_idx);
	public List<MessageVo> selectMessageByUserid(String msg_userid); 


}
