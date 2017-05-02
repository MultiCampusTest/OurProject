package tm.matching.service;

import java.util.HashMap;
import java.util.List;

import tm.matching.vo.MatchingVo;


public interface IMatchingService {
	
	public boolean matchingSend(MatchingVo matchingVo);
	public boolean matchingModify(String mch_t_userid, String mch_g_userid);
	public boolean matchingCancel(int mch_idx);
	public HashMap<String, Object> matchingList(String mch_g_userid);

}