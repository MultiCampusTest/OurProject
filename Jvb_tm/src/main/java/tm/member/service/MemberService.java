package tm.member.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.member.dao.IMemberDao;
import tm.member.vo.MemberVo;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private IMemberDao memberDao;

	@Override
	public boolean checkValidation(String userid, String pwd) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = memberDao.memberSelectOne(userid);
		if(params.get(userid).equals(pwd))
			return true;
		else
			return false;
	}
}
 