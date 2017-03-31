package java.dao.boardreviewdao;

import java.util.HashMap;
import java.util.List;

public interface IBoardReviewDao {
	
	public int insertReviewBoard(HashMap<String, Object> params);
	public int updateReviewBoard(HashMap<String, Object> params);
	public int deleteReviewBoard(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); //세부글 보기 
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); //게시판 별 목록
	public List<HashMap<String, Object>> selectByCategory(HashMap<String, Object> params);

}
