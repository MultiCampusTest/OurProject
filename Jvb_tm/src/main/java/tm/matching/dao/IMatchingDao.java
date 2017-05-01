package tm.matching.dao;

import java.util.HashMap;
import java.util.List;

import tm.matching.vo.MatchingVo;


public interface IMatchingDao {
	
	public int matchingInsert(MatchingVo matchingVo);
	public int matchingUpdate(MatchingVo matchingVo);
	public int matchingDelete(int mch_idx);
	public List<HashMap<String, Object>> matchingSelectByUserid(String mch_g_userid);

	
}