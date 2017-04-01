package java.dao.matchingdao;

import java.util.HashMap;
import java.util.List;
import java.vo.MatchingVo;

public interface IMatchingDao {
	
	public int insertMatching(MatchingVo matchingVo);
	public int updateMatching(MatchingVo matchingVo);
	public int deleteMatching(int mch_idx);
	public List<HashMap<String, Object>> selectMatchingByUserid(String mch_userid);

}
