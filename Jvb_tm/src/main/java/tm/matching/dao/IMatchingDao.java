package tm.matching.dao;

import java.util.HashMap;
import java.util.List;

import tm.matching.vo.MatchingVo;


public interface IMatchingDao {
	
	public int matchingInsert(MatchingVo matchingVo);
	public int matchingUpdate(HashMap<String, Object> params);
	public int matchingDelete(int mch_idx);
	public List<MatchingVo> matchingSelectByUserid(String mch_t_userid);
	public List<MatchingVo> matchingStatus(int b_idx);
	
}