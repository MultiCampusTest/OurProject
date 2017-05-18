package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.ContentsVo;

public interface IContentsDao {	
	//insert
	public int insertContents(ContentsVo contens);
	
	//update
	public int updateContents(ContentsVo contents);
	
	//delete
	public int deleteContents(int boardIdx);
	
	//select
	public ContentsVo selectOneContents(int boardIdx);
	public List<ContentsVo> selectContents(int boardIdx);

}
