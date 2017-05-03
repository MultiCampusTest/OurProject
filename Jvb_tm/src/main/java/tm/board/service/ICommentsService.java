package tm.board.service;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsService {
	public int insertComments(CommentsVo comments);
	
	
	
	public int updateInsertComments();
	
	public int updateComments();
	
	public int deleteComments();
	
	public CommentsVo selectOne();
	public List<HashMap<String, Object>> selectListComments();
}
