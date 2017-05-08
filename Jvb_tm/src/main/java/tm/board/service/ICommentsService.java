package tm.board.service;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.CommentsVo;

public interface ICommentsService {
	public void insertComments(CommentsVo comments, String parent_cm);
	public List<CommentsVo> selectComments(int b_idx);
	public void updateComments(CommentsVo comments);
	public boolean deleteComments(int cm_idx);
}