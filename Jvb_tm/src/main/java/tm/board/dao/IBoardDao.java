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
	public int insertBoard(BoardVo boardVo);
	
	
	//update board	
	public int boardUpdate(BoardVo boardVo);
	
	//delete board
	public int deleteBoard(int b_idx);
	
	
	//get_board_count
	public int getBoardCountByCode(String code);
	
	//select 
	//common board select
	public HashMap<String, Object> boardSelectByLimit(BoardVo boardVo);
	public int boardGetCount();
	
	//select NoticeBoard
	public BoardVo selectOneNotice(int b_idx); 
	public List<BoardVo> selectNoticeBoardLimit(HashMap<String, Object> params);
	
	//other board select
	public BoardVo otherBoardSelectOne(int b_idx); 
	public List<HashMap<String, Object>> otherBoardSelectByCode(String code);
	public List<HashMap<String, Object>> otherBoardSelectByLoc_Category(String b_loc_category);
	public List<HashMap<String, Object>> otherBoardSelectBySub_Category(String b_sub_category);
	
}
