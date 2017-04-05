package tm.member.dao;

import java.util.HashMap;

import tm.commons.vo.ImageVo;
import tm.member.vo.MemberVo;


public interface IMemberDao {
	public MemberVo loginCheck(MemberVo memberVo);
	public MemberVo getId(MemberVo memberVo);
	public MemberVo getPwd(MemberVo memberVo);
	public MemberVo idCheck(String userid);
	public int insertMember(MemberVo memberVo);
	public int insertImage(ImageVo imageVo);
	public int updateMember(MemberVo memberVo);
	public int updateImage(ImageVo imageVo);
	public MemberVo pwdCheck(String userid);
	public int deleteMember(int u_idx);
	public HashMap<String, Object> selectOne(String userid);
}