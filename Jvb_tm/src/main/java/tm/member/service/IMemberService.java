package tm.member.service;

import tm.member.vo.MemberVo;

public interface IMemberService {
	public boolean memberJoin(MemberVo memberVo);
	public boolean memberRemove(MemberVo memberVo);
	public boolean checkLogin(String userid, String pwd);
	public boolean checkId(String userid);
	
}
