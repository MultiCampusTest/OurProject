package tm.member.dao;

import java.util.HashMap;

import tm.member.vo.MemberVo;
 

public interface IMemberDao {
	public int memberInsert(MemberVo memberVo);
	public int memberUpdate(MemberVo memberVo);
	public int passwordReset(MemberVo memberVo);
	public int memberDelete(MemberVo memberVo);
	public MemberVo memberSelectOne(String userid);
	public MemberVo findEmail(HashMap<String, Object> params);
}