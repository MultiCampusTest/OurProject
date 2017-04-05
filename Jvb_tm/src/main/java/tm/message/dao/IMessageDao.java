package tm.message.dao;

import java.util.List;

import tm.message.vo.MessageVo;



public interface IMessageDao {
	
	public int insertMessage(MessageVo messageVo);
	public int deleteMessage(int msg_idx);
	public List<MessageVo> selectMessageByUserid(String msg_userid); 


}
