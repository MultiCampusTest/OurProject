package tm.member.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.member.vo.MemberVo;

public interface IMemberService {
	public void memberJoin(MemberVo memberVo, MultipartHttpServletRequest req);
	public boolean memberRemove(MemberVo memberVo);
	public boolean checkLogin(String userid, String pwd);
	public boolean checkId(String userid);
	
	public MemberVo memberSelectOne(String userid);
	
}
