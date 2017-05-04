package tm.board.dao;

import java.util.HashMap;

import tm.board.vo.ContentsVo;

public interface IContentsDao {	
	//insert
	public int insertContents(ContentsVo contens);
	
	//update
	public int updateContents(ContentsVo contents);
	
	//delete
	public int deleteContents(int b_idx);
	
	//select
	public ContentsVo selectOneContents(int boardIdx);
	public HashMap<String, Object> selectOneOrderByContents(int b_idx);

}
