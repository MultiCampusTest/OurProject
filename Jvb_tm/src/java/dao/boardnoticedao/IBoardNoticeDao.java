package java.dao.boardnoticedao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;

public interface IBoardNoticeDao {
	
	public int insertBoardNotice(BoardVo boardVo);
	public int updateBoardNotice(BoardVo boardVo);
	public int deleteBoardNotice(int b_idx);
	public BoardVo selectNoticeOne(int b_idx);
	public BoardVo selectNoticeBySearch(HashMap<String, Object> params);
	public BoardVo selectByCode(); 
	public BoardVo selectNoticeByLimit(HashMap<String, Object> params);
	public int getCountNotice();
	
}
