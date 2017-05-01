package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.ContentsVo;
import tm.board.vo.MapPositionVo;
import tm.image.vo.ImageVo;


public interface IBoardDao {
	
	//insert board
	public int noticeBoardInsert(BoardVo boardVo);
	public int travelBoardInsert(BoardVo boardVo);
	public int guideBoardInsert(BoardVo boardVo);
	public int reviewBoardInsert(BoardVo boardVo);
	
	//update board	
	public int boardUpdate(BoardVo boardVo);
	
	//delete board
	public int deleteBoard(int b_idx);
	
	//select 
	//common board select
	public HashMap<String, Object> boardSelectByLimit(BoardVo boardVo);
	public int boardGetCount();
	
	//notice select
	public BoardVo noticeBoardSelectOne(int b_idx); 
	public List<HashMap<String, Object>> noticeBoardSelectByCode(String code); 
	
	
	//other board select
	public BoardVo otherBoardSelectOne(int b_idx); 
	public List<HashMap<String, Object>> otherBoardSelectByCode(String code);
	public List<HashMap<String, Object>> otherBoardSelectByLoc_Category(String b_loc_category);
	public List<HashMap<String, Object>> otherBoardSelectBySub_Category(String b_sub_category);
	
}
