package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsDao {	
	
//	insert시 필요한 Dao
	public int insertComments(CommentsVo comments);
	public int updateComments1(CommentsVo comments);
	public int updateComments2(CommentsVo comments);
	public CommentsVo selectOne(int cm_idx);
	public int selectMaxOrder1(int b_idx);
	public int selectMaxOrder2(CommentsVo comments);
	public int increaseOrder(CommentsVo comments);
	
//	select시 필요한 Dao
	public List<CommentsVo> selectComments(int b_idx);
	
//	delete시 필요한 Dao
	public int deleteComments(int cm_idx);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	public CommentsVo selectOneByParent(String cm_parent);
//	public int updateByOrder(CommentsVo comments);
//	public int selectOneMaxOrder(String b_idx);
//	public int insertComments(CommentsVo comments);
//	public int selectMaxOrderToParent(CommentsVo comments);
//	public int updateOrderPlus(CommentsVo commentsVo);
//	public int updateGroupChild(CommentsVo commentsVo);
	
	
//	업데이트시 필요한 Dao
//	public int updateComments(CommentsVo comments);
	
	
	
	
	
	
	public int updateComments(HashMap<String, Object> params);
	
	
}
