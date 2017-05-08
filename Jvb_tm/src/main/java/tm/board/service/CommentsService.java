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
	public void insertComments(CommentsVo comments, String parent_cm) {
		// TODO Auto-generated method stub
		cDao.insertComments(comments);
		if(comments.getCm_parent() == 0){
			comments.setCm_parent(comments.getCm_idx());
			comments.setCm_depth(0);
			System.out.println(cDao.selectMaxOrder1(comments.getB_idx())+1);
			comments.setCm_order(cDao.selectMaxOrder1(comments.getB_idx())+1);
			cDao.updateComments1(comments); 
		} else {
			CommentsVo reComments = cDao.selectOne(comments.getCm_idx());
			int cm_parent = reComments.getCm_parent();
			int cm_order = cDao.selectMaxOrder2(comments);
			reComments.setCm_content("<b>"+parent_cm+"</b>" + reComments.getCm_content());
			reComments.setCm_parent(cm_parent);
			reComments.setCm_depth(1);
			reComments.setCm_order(cm_order + 1);
			cDao.increaseOrder(reComments);
			cDao.updateComments2(reComments);
		}
	}
	
	@Override
	public void updateComments(CommentsVo comments) {
		cDao.updateCommentsContent(comments);
	}
	
	@Override
	public boolean deleteComments(int cm_idx) {
		// TODO Auto-generated method stub
		cDao.deleteComments(cm_idx);
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

