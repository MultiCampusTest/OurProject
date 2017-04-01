package java.dao.memberdao;

import java.util.HashMap;
import java.vo.MemberVo;

public interface IMemberDao {
	public MemberVo loginCheck(MemberVo memberVo);
	public MemberVo getId(MemberVo memberVo);
	public MemberVo getPwd(MemberVo memberVo);
	public HashMap<String, Object> idCheck(String userid);
	public int insertMember(MemberVo memberVo);
	public int updateMember(MemberVo memberVo);
	public int deleteMember(int u_idx);
	public MemberVo deletePwdCheck(String userid);
	public MemberVo selectOne(String userid);
	
	
}