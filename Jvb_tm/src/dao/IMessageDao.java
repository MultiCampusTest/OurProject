package dao;

public interface IMessageDao {
	
	public int insertMessage(Message message);
	public int deleteMessage(Message message);
	public List<Message> selectBySend(String userid); //�߽��� or ������
//	public List<Message> selectBySend(String send_userid);  //�߽���
//	public List<Message> selectByReceive(String receive_userid); //������
	

}
