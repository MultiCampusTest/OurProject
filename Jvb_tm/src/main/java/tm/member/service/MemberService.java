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
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		if(memberVo != null) {
			if(memberVo.getPwd().equals(pwd))
				return true;
			else
				return false;			
		} else
			return false;
	}


	@Override
	public boolean checkId(String userid) {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		if(memberVo == null)
			return false;
		else
			return true;
	}


	@Override
	public boolean memberRemove(MemberVo memberVo) {
		// TODO Auto-generated method stub
		int result = memberDao.memberDelete(memberVo);
		
		if(result > 0)
			return true;
		else
			return false;
	}


	@Override
	public MemberVo memberSelectOne(String userid) {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		return memberVo;
	}
	
}
