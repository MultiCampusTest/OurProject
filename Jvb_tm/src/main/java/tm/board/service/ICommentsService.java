package tm.board.service;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsService {
	public void insertComments(CommentsVo comments);
	
	public List<CommentsVo> selectComments(int b_idx);
	
	public boolean updateComments(CommentsVo comments);
	
	public boolean deleteComments(String cm_parent);
	
	
	public int updateInsertComments();
	
	
	
	public CommentsVo selectOne();
	public List<HashMap<String, Object>> selectListComments();
}