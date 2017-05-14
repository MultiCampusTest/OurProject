package tm.member.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.member.vo.EmailVo;
import tm.member.vo.MemberVo;

public interface IMemberService {
	public void memberJoin(MemberVo memberVo, MultipartHttpServletRequest req);
	public boolean memberRemove(MemberVo memberVo);
	public boolean checkLogin(String userid, String pwd);
	public boolean checkId(String userid);
	
	public HashMap<String, Object> memberSelectOne(String userid);
	public boolean memberModify(MemberVo memberVo);
	
	
	public boolean searchPassword(MemberVo memberVo);
	public void sendEmail(EmailVo emailVo) throws Exception;
}
