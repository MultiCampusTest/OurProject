package dao;

public interface IContentsDao {
	
	public int insertContents(Contents contents);
	public int updateContents(Contents contents);
	public int deleteContents(int b_idx);
	public List<Contents> selectByIdx(int b_idx);

}
