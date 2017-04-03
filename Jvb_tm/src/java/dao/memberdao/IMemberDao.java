package java.dao.memberdao;

import java.util.HashMap;
import java.vo.ImageVo;
import java.vo.MemberVo;

public interface IMemberDao {
	public MemberVo loginCheck(MemberVo memberVo);
	public MemberVo getId(MemberVo memberVo);
	public MemberVo getPwd(MemberVo memberVo);
	public MemberVo idCheck(String userid);
	public int insertMember(MemberVo memberVo);
	public int insertImage(ImageVo imageVo);
	public int updateMember(MemberVo memberVo);
	public int updateImage(ImageVo imageVo);
	public int deleteMember(int u_idx);
	public MemberVo deletePwdCheck(String userid);
	public HashMap<String, Object> selectOne(String userid);
}