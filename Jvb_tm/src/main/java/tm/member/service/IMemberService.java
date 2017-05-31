package tm.member.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.member.vo.MemberVo;

public interface IMemberService {
	public void memberJoin(MemberVo memberVo, String img_code, MultipartHttpServletRequest req) throws Exception;
	public boolean memberRemove(MemberVo memberVo);
	public boolean checkLogin(String userid, String pwd) throws Exception;
	public boolean checkId(String userid);
	
	public HashMap<String, Object> memberSelectOne(String userid);
	public boolean memberModify(MemberVo memberVo, String userid, MultipartHttpServletRequest req);
	
	public boolean searchPassword(MemberVo memberVo);
	
	
	public HashMap<String, Object> findUsername(String firstName, String birthday);
	public HashMap<String, Object> findPassword(String userid, String firstName);
	
	public String generateKey(String pwd) throws Exception;
}
