package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.MapPositionVo;
import tm.commons.vo.ContentsVo;
import tm.commons.vo.ImageVo;


public interface IBoardDao {
	
	//board
	public int insertBoard(BoardVo boardVo);
	public int updateBoard(BoardVo boardVo);
	public int deleteBoard(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); 
	public List<HashMap<String, Object>> selectBoardByCode(String code); 
	public List<HashMap<String, Object>> selectBoardByLocCategory(String b_loc_category);
	public List<HashMap<String, Object>> selectBoardBySubCategory(String b_sub_category);
	public List<HashMap<String, Object>> selectBoardByLimit(HashMap<String, Object> params);
	public int getCountBoard();
	public List<BoardVo> selectBoardBySearch(HashMap<String, Object> params);


	
}
