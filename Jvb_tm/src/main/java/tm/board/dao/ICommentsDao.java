package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsDao {	
	public int commentsInsert(CommentsVo commentsVo);
	public int commentsUpdate(HashMap<String, Object> params);
	public int commentsDelete(int b_idx, int c_idx);
	public List<HashMap<String, Object>> commentsSelectByIdx(int b_idx);
}
