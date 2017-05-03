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
	public int insertComments(CommentsVo comments) {
		// TODO Auto-generated method stub
		if(comments.getCm_idx() == null || "".equals(comments.getCm_idx())){
			if(comments.getCm_parent() != null ){
				CommentsVo commentInfo = cDao.selectOneByParent(comments.getCm_parent());
				comments.setCm_depth(commentInfo.getCm_depth());
				comments.setCm_order(commentInfo.getCm_order() + 1);
				cDao.updateByOrder(commentInfo);
			} else {
				int cm_order = cDao.selectOneMaxOrder(comments.getB_idx());
				comments.setCm_order(cm_order);
			}
			cDao.insertComments(comments);
		} else {
			cDao.updateByOrder(comments);
		}
		return 0;
	}

	@Override
	public int updateInsertComments() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComments() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComments() {
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
