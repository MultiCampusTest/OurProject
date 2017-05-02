package tm.matching.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.matching.dao.IMatchingDao;
import tm.matching.vo.MatchingVo;

@Service
public class MatchingService implements IMatchingService {

	@Autowired
	private IMatchingDao matchingDao;

	// singletone
	private static MatchingService instance;

	public static MatchingService getInstance() {
		if (instance == null) {
			instance = new MatchingService();
			return instance;
		}
		return instance;
	}
	

	@Override
	public boolean matchingSend(MatchingVo matchingVo) {
		// TODO Auto-generated method stub
		int result=matchingDao.matchingInsert(matchingVo);
		if(result>0){
			return true;
		}
		else{
			return false;
		}
	}

	@Override
	public boolean matchingModify(String mch_t_userid, String mch_g_userid) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params=new HashMap<>();
		params.put("mch_t_userid", mch_t_userid);
		params.put("mch_g_userid", mch_g_userid);
		int result=matchingDao.matchingUpdate(params);
		if(result>0){
			return true;
		}
		else{
			return false;
		}
	}

	@Override
	public boolean matchingCancel(int mch_idx) {
		// TODO Auto-generated method stub
		int result=matchingDao.matchingDelete(mch_idx);
		if(result>0){
			return true;
		}
		else{
			return false;
		}
	}

	@Override
	public HashMap<String, Object> matchingList(String mch_g_userid) {
		// TODO Auto-generated method stub
		List<MatchingVo> matchingByUserid=matchingDao.matchingSelectByUserid(mch_g_userid);
		HashMap<String, Object> matchingList=new HashMap<>();
		matchingList.put("matchingList", matchingByUserid);
		return matchingList;
	}
	
	
	

}
