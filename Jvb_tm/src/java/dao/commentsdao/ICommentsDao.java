package java.dao.commentsdao;

import java.util.HashMap;
import java.util.List;

public interface ICommentsDao {
	
	public int insertComments(HashMap<String, Object> params);
	public int updateComments(HashMap<String, Object> params);
	public int deleteComments(int b_idx, int c_idx);
	public List<HashMap<String, Object>> selectCommentsByIdx(int b_idx);
	

}
