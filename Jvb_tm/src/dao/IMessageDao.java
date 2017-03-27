package dao;

public interface IMessageDao {
	
	public int insertMessage(Message message);
	public int deleteMessage(Message message);
	public List<Message> selectBySend(String userid); //발신함 or 수신함
//	public List<Message> selectBySend(String send_userid);  //발신함
//	public List<Message> selectByReceive(String receive_userid); //수신함
	

}
