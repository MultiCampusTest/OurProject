package tm.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.board.dao.ICommentsDao;
import tm.board.vo.CommentsVo;

@Service
public class CommentsService implements ICommentsService{

	@Autowired
	private ICommentsDao cDao;
	
	@Override
	public void insertComments(CommentsVo comments) {
		// TODO Auto-generated method stub
		cDao.insertComments(comments);
		if(comments.getCm_parent() == 0){
			comments.setCm_parent(comments.getB_idx());
			comments.setCm_depth(0);
			comments.setCm_order(0);
			cDao.updateComments(comments); 
		} else {
			CommentsVo reComments = cDao.selectOne(comments.getCm_idx());
			int cm_parent = reComments.getCm_parent();
			int cm_depth = reComments.getCm_depth();
			int cm_order = cDao.selectMaxOrder(comments);
			reComments.setCm_parent(cm_parent);
			reComments.setCm_depth(1);
			reComments.setCm_order(cm_order + 1);
			cDao.increaseOrder(reComments);
			cDao.updateComments(comments);
		}
	}
	
	@Override
	public boolean updateComments(CommentsVo comments) {
		// TODO Auto-generated method stub
		int result = cDao.updateComments(comments);
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean deleteComments(CommentsVo comments) {
		// TODO Auto-generated method stub
		cDao.deleteComments(comments);
		return true;
	}
	
	@Override
	public List<CommentsVo> selectComments(int b_idx) {
		// TODO Auto-generated method stub
		return cDao.selectComments(b_idx);
	}
	

	
	
	
	@Override
	public int updateInsertComments() {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public CommentsVo selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HashMap<String, Object>> selectListComments() {
		// TODO Auto-generated method stub
		return null;
	}


	
	

}

