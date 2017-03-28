package java.dao.matchingdao;

import java.util.HashMap;
import java.util.List;

public interface IMatchingDao {
	
	public int insertMatching(HashMap<String, Object> params);
	public int updateMatching(HashMap<String, Object> params);
	public int deleteMatching(int mch_idx);
	public List<HashMap<String, Object>> selectByUserid(String userid);

}
