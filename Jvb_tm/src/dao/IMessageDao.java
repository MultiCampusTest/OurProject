package dao;

import java.util.HashMap;
import java.util.List;

public interface IMessageDao {
	
	public int insertMessage(HashMap<String, Object> params);
	public int deleteMessage(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBySend(String userid); //�߽��� or ������
//	public List<Message> selectBySend(String send_userid);  //�߽���
//	public List<Message> selectByReceive(String receive_userid); //������
	

}
