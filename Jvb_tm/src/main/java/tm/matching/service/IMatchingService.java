package tm.matching.service;

import java.util.HashMap;

import tm.matching.vo.MatchingVo;


public interface IMatchingService {
	
	public void sendMatching(MatchingVo matchingVo);
	public boolean modifyMatching(MatchingVo matchingVo);
	public boolean cancelMatching(int mch_idx);
	public HashMap<String, Object> matchingList(String mch_idx);


}