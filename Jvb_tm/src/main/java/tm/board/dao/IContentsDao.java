package tm.board.dao;

import java.util.HashMap;

import tm.board.vo.ContentsVo;

public interface IContentsDao {
	
	public int insertContents(ContentsVo contens);
	public int updateContents(ContentsVo contents);
	public int deleteContents(int b_idx);
	public HashMap<String, Object> selectContentsOne(int b_idx);

}
