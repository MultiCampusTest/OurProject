package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsDao {	
	
//	insert시 필요한 Dao
	public CommentsVo selectOneByParent(String cm_parent);
	public CommentsVo updateByOrder(CommentsVo comments);
	public int selectOneMaxOrder(String b_idx);
	public int insertComments(CommentsVo comments);
	
	
	
	
	
	public int updateComments(HashMap<String, Object> params);
	public int deleteComments(int b_idx, int c_idx);
	
	
	public List<HashMap<String, Object>> selectByIdxComments(int b_idx);
}
