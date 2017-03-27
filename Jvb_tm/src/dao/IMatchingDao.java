package dao;

public interface IMatchingDao {
	
	public int insertMatching(Matching matching);
	public int updateMatching(Matching matching);
	public int deleteMatching(int mch_idx);
	public List<Matching> selectByUserid(String userid);

}
