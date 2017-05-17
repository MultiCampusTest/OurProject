package tm.matching.dao;

import java.util.HashMap;
import java.util.List;

import tm.matching.vo.MatchingVo;


public interface IMatchingDao {
	
	public int matchingInsert(MatchingVo matchingVo);
	public int matchingUpdate(HashMap<String, Object> params);
	public void matchingFail(int b_idx);
	public int matchingDelete(int mch_idx);
	public List<MatchingVo> matchingSelectByUserid(HashMap<String, Object> params);
	public MatchingVo matchingSelectComplete(int b_idx);
	
	
}