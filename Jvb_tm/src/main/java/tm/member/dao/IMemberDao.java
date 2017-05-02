package tm.member.dao;

import java.util.HashMap;

import tm.member.vo.MemberVo;
 

public interface IMemberDao {
	public MemberVo memberSelectOne(String userid);
}