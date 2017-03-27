package dao;

public interface IMemberDao {
	
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String userid);
	public Member selectOne(String userid);
}
