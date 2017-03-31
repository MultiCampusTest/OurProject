package java.dao.messagedao;

import java.util.HashMap;
import java.util.List;

public interface IMessageDao {
	
	public int insertMessage(HashMap<String, Object> params);
	public int deleteMessage(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectMessageByUserid(String msg_userid); 

	

}
