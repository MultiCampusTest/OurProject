package java.dao.memberdao;

import java.util.HashMap;

public interface IMemberDao {
	
	public HashMap<String, Object> loginCheck(HashMap<String, Object> params);
	public HashMap<String, Object> getId(HashMap<String, Object> params);
	public HashMap<String, Object> getPwd(HashMap<String, Object> params);
	public HashMap<String, Object> idCheck(HashMap<String, Object> params);
	public int insertMember(HashMap<String, Object> params);
	public HashMap<String, Object> selectOne(String userid);
	public int updateMember(HashMap<String, Object> params);
	public int deleteMember(String userid);
	public HashMap<String, Object> deletePwdCheck(String userid);

}
