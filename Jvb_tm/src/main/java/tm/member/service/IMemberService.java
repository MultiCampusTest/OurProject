package tm.member.service;

import tm.member.vo.MemberVo;

public interface IMemberService {
	
	//로그인 유효성 체크
	public boolean checkValidation(String userid, String pwd);
	
}
