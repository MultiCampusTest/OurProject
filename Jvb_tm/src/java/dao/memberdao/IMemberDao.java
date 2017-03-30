package java.dao.memberdao;

import java.util.HashMap;

public interface IMemberDao {
	
	public HashMap<String, Object> loginCheck(HashMap<String, Object> params);
	public HashMap<String, Object> getId(HashMap<String, Object> params);
	public HashMap<String, Object> getPwd(HashMap<String, Object> params);
	public HashMap<String, Object> idCheck(HashMap<String, Object> params);

}
