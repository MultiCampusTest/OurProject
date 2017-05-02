package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsDao {	
	public int insertComments(CommentsVo commentsVo);
	public int updateComments(HashMap<String, Object> params);
	public int deleteComments(int b_idx, int c_idx);
	public List<HashMap<String, Object>> selectByIdxComments(int b_idx);
}
