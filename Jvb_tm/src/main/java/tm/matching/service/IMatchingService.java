package tm.matching.service;

import java.util.HashMap;
import java.util.List;

import tm.matching.vo.MatchingVo;


public interface IMatchingService {
	
	public boolean matchingSend(MatchingVo matchingVo);
	public boolean matchingModify(int b_idx, String mch_g_userid, int mch_code);
	public boolean matchingCancel(int mch_idx);
	public HashMap<String, Object> matchingList(String mch_t_userid);
	
}