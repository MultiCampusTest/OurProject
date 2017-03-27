package dao;

public interface ICommentsDao {
	
	public int insertComments(Comments comments);
	public int updateComments(Comments comments);
	public int deleteComments(int b_idx, int c_idx);
	public List<Comments> selectByIdx(int b_idx);
	

}
