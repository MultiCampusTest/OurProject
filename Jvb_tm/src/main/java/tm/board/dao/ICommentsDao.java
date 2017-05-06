package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsDao {	
	
//	insert시 필요한 Dao
	public CommentsVo selectOneByParent(String cm_parent);
	public int updateByOrder(CommentsVo comments);
	public int selectOneMaxOrder(String b_idx);
	public int insertComments(CommentsVo comments);
	public int selectMaxOrderToParent(CommentsVo comments);
	public int updateOrderPlus(CommentsVo commentsVo);
	
//	select시 필요한 Dao
	public List<CommentsVo> selectByIdxComments(int b_idx);
	
//	업데이트시 필요한 Dao
	public int updateComments(CommentsVo comments);
	
//	delete시 필요한 Dao
	public int deleteComments(String cm_idx);
	public int selectCommentsChild(String cm_parent);
	
	
	
	
	
	public int updateComments(HashMap<String, Object> params);
	
	
}
