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
				System.out.println("부모가 누구냐"+comments.getCm_parent());
				int order = cDao.selectMaxOrderToParent(comments);
				System.out.println("order는 몇이냐"+order);
				if(order == 0){
					CommentsVo commentP = cDao.selectOneByParent(comments.getCm_parent());
					order= commentP.getCm_order();
				}
				System.out.println("그래서 order는?"+order);
				CommentsVo commentInfo = cDao.selectOneByParent(comments.getCm_parent());
				comments.setCm_depth(commentInfo.getCm_depth());
//				comments.setCm_order(commentInfo.getCm_order() + 1);
				comments.setCm_order(order + 1);
//				cDao.updateByOrder(commentInfo);
				System.out.println("order랑 b_idx는"+comments.getCm_order()+"  "+comments.getB_idx());
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

