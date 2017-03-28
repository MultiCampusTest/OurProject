package java.dao.memberdao;

import java.util.HashMap;

public interface IMemberDao {
	
	public int insertMember(HashMap<String, Object> params);
	public int updateMember(HashMap<String, Object> params);
	public int deleteMember(String userid);
	public HashMap<String, Object> selectOne(String userid);
}
