package tm.matching.service;

import java.util.HashMap;

import tm.matching.vo.MatchingVo;


public interface IMatchingService {
	
	public void matchingSend(MatchingVo matchingVo);
	public boolean matchingModify(MatchingVo matchingVo);
	public boolean matchingCancel(int mch_idx);
	public HashMap<String, Object> matchingList(String mch_idx);

}