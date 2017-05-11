package tm.message.dao;

import java.util.HashMap;
import java.util.List;

import tm.message.vo.MessageVo;



public interface IMessageDao {
	
	public int messageInsert(MessageVo messageVo);
	public int messageDelete(int msg_idx);
	public List<MessageVo> messageSelectByUserid(HashMap<String, Object> params);
	public List<MessageVo> messageSelectOne(HashMap<String, Object> params);

	
}