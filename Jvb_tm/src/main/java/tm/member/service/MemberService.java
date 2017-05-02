package tm.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.member.dao.IMemberDao;
import tm.member.vo.MemberVo;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private IMemberDao memberDao;

	@Override
	public boolean memberJoin(MemberVo memberVo) {
		// TODO Auto-generated method stub
		int result = memberDao.memberInsert(memberVo);
		
		if(result > 0)
			return true;
		else
			return false;
	}
	

	@Override
	public boolean checkLogin(String userid, String pwd) {
		// TODO Auto-generated method stub
		MemberVo member = memberDao.memberSelectOne(userid);
		
		if(member != null) {
			if(member.getPwd().equals(pwd))
				return true;
			else
				return false;			
		} else
			return false;
	}
	
}
