package tm.board.dao;

import java.util.HashMap;

import tm.board.vo.ContentsVo;

public interface IContentsDao {	
	//insert
	public int contentsInsert(ContentsVo contens);
	
	//update
	public int contentsUpdate(ContentsVo contents);
	
	//delete
	public int contentsDelete(int b_idx);
	
	//select
	public HashMap<String, Object> contentsSelectOne(int b_idx);
	public HashMap<String, Object> contentsSelectOneOrderby(int b_idx);

}
