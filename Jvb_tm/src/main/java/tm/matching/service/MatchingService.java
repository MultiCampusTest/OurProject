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
	public boolean matchingModify(int b_idx, String mch_g_userid, int mch_code) {
		// TODO Auto-generated method stub
		System.out.println(b_idx);
		System.out.println(mch_g_userid);
		HashMap<String, Object> params=new HashMap<>();
		params.put("b_idx", b_idx);
		params.put("mch_g_userid", mch_g_userid);
		params.put("mch_code", mch_code);
		int result=matchingDao.matchingUpdate(params);
		if(result>0){
			if(mch_code==1){
				matchingDao.matchingFail(b_idx);
			}
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
	public HashMap<String, Object> matchingList(String mch_t_userid) {
		// TODO Auto-generated method stub
		HashMap<String, Object> res_params=new HashMap<>();
		res_params.put("mch_t_userid", mch_t_userid);
		res_params.put("mch_code", 0);
		
		HashMap<String, Object> acc_params=new HashMap<>();
		acc_params.put("mch_t_userid", mch_t_userid);
		acc_params.put("mch_code", 1);
		
		
		List<MatchingVo> res_matchingByUserid=matchingDao.matchingSelectByUserid(res_params);
		List<MatchingVo> acc_matchingByUserid=matchingDao.matchingSelectByUserid(acc_params);
		
		HashMap<String, Object> matchingList=new HashMap<>();
		matchingList.put("res_matchingList", res_matchingByUserid);
		matchingList.put("res_matchingListSize", res_matchingByUserid.size());
		matchingList.put("acc_matchingList", acc_matchingByUserid);
		matchingList.put("acc_matchingListSize", acc_matchingByUserid.size());
		return matchingList;
	}


	

	
	

}
