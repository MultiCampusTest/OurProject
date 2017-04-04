package tm.board.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;
import java.vo.ContentsVo;

public interface IBoardNoticeDao {
	
	public int insertBoardNotice(BoardVo boardVo);
	public int insertContentsNotice(ContentsVo contentsVo);
	public int updateBoardNotice(BoardVo boardVo);
	public int updaetContentsNotice(ContentsVo contentsVo);
	public int deleteBoardNotice(int b_idx);
	public int deleteContentsNotice(int b_idx);
	public BoardVo selectNoticeOne(int b_idx);
	public ContentsVo selectContentsNoticeOne(int b_idx);
	public List<BoardVo> selectNoticeBySearch(HashMap<String, Object> params);
	public List<BoardVo> selectByCode(); 
	public List<BoardVo> selectNoticeByLimit(HashMap<String, Object> params);
	public int getCountNotice();
}
