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
		if(comments.getCm_idx() == null || "".equals(comments.getCm_idx())){
			if(comments.getCm_parent() != null ){
				int order = cDao.selectMaxOrderToParent(comments);
				if(order == 0){
					CommentsVo commentP = cDao.selectOneByParent(comments.getCm_parent());
					order= commentP.getCm_order();
				}
				CommentsVo commentInfo = cDao.selectOneByParent(comments.getCm_parent());
				comments.setCm_depth(commentInfo.getCm_depth());
//				comments.setCm_order(commentInfo.getCm_order() + 1);
				comments.setCm_order(order + 1);
//				cDao.updateByOrder(commentInfo);
				cDao.updateOrderPlus(comments);
			} else {
				int cm_order = cDao.selectOneMaxOrder(comments.getB_idx());
				comments.setCm_order(cm_order);
			}
			cDao.insertComments(comments);
		} else {
			cDao.updateByOrder(comments);
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
	public boolean deleteComments(String cm_parent) {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public List<CommentsVo> selectComments(int b_idx) {
		// TODO Auto-generated method stub
		return cDao.selectByIdxComments(b_idx);
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

