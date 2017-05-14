package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.ContentsVo;
import tm.board.vo.MapPositionVo;
import tm.image.vo.ImageVo;
 

public interface IBoardDao {
	
	//공통부문
	public int insertBoard(BoardVo boardVo);
	public BoardVo selectOneBoard(int boardIdx); 
	
	
	
	//update 	
	public int updateNotice(BoardVo board);
	public int updateGuide(BoardVo board);
	
	//delete
	public int deleteBoard(int b_idx);
	
	//select
	
	
	
	
	//get_board_count
	public int getNoticeBoardCount(HashMap<String, Object> params);
	public int getCommonBoardCount(HashMap<String, Object> params);
	public int getReviewBoardCount(HashMap<String, Object> params);
	
	//select 
	//common board select
	public List<BoardVo> selectCommonBoardLimit (HashMap<String, Object> params); 
	
	public int boardGetCount();
	
	//select NoticeBoard
	public List<BoardVo> selectNoticeBoardLimit(HashMap<String, Object> params);
	
	//select ReivewBoard
	public List<BoardVo> selectReviewBoardLimit(HashMap<String, Object> params);
	//update ReviewBoard
	public int readReview(int boardIdx);
	
	//other board select
	public BoardVo otherBoardSelectOne(int b_idx); 
	public List<HashMap<String, Object>> otherBoardSelectByCode(String code);
	public List<HashMap<String, Object>> otherBoardSelectByLoc_Category(String b_loc_category);
	public List<HashMap<String, Object>> otherBoardSelectBySub_Category(String b_sub_category);
	
}
