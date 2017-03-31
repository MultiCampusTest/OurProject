package java.dao.memberdao;

import java.util.HashMap;

public interface IMemberDao {
	
	public HashMap<String, Object> loginCheck(HashMap<String, Object> params);
	public HashMap<String, Object> getId(HashMap<String, Object> params);
	public HashMap<String, Object> getPwd(HashMap<String, Object> params);
	public HashMap<String, Object> idCheck(String userid);
	public int insertMember(HashMap<String, Object> params);
	public int updateMember(HashMap<String, Object> params);
	public int deleteMember(int u_idx);
	public HashMap<String, Object> deletePwdCheck(String userid);
	public HashMap<String, Object> selectOne(String userid);

}
