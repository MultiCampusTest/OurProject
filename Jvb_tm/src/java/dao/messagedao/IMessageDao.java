package dao;

import java.util.HashMap;
import java.util.List;

public interface IMessageDao {
	
	public int insertMessage(HashMap<String, Object> params);
	public int deleteMessage(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBySend(String userid); //발신함 or 수신함
//	public List<Message> selectBySend(String send_userid);  //발신함
//	public List<Message> selectByReceive(String receive_userid); //수신함
	

}
