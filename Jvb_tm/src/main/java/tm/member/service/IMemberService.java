package tm.member.service;

import java.util.HashMap;
import java.util.List;

public interface IMemberService {
	public boolean insertMember(String userid, String pwd, String name, String email,
			String birthday, String nationality, String gender, String introduce);
	
	public boolean updateMember(String pwd, String name, String email,
			String nationality, String introduce, String userid);
	
	public boolean deleteMember(String userid);
	
	public HashMap<String, Object> selectOne(String userid);
	
	public List<HashMap<String, Object>> selectAll();
}
