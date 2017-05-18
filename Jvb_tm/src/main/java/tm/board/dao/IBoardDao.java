package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.ContentsVo;
import tm.board.vo.MapPositionVo;
import tm.image.vo.ImageVo;
  

public interface IBoardDao {
	
	//insert
	public int insertBoard(BoardVo boardVo);
	 
	
	//update 	
	public int updateNotice(BoardVo board);
	public int updateCommonBoard(BoardVo board);
	public int updateReview(BoardVo board);
	
	//delete
	public int deleteBoard(int boardIdx);
	
	//select
	public BoardVo selectOneBoard(int boardIdx);
	
	public List<BoardVo> selectNoticeBoardLimit(HashMap<String, Object> params);
	public List<BoardVo> selectCommonBoardLimit (HashMap<String, Object> params); 
	public List<BoardVo> selectReviewBoardLimit(HashMap<String, Object> params);
	
	//get_board_count
	public int getNoticeBoardCount(HashMap<String, Object> params);
	public int getCommonBoardCount(HashMap<String, Object> params);
	public int getReviewBoardCount(HashMap<String, Object> params);
	
	//update ReviewBoard
	public int readReview(int boardIdx);
	

}
