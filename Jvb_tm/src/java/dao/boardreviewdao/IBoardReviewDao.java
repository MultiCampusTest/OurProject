package java.dao.boardreviewdao;

import java.util.HashMap;
import java.util.List;

public interface IBoardReviewDao {
	
	public int insertReviewBoard(HashMap<String, Object> params);
	public int updateReviewBoard(HashMap<String, Object> params);
	public int deleteReviewBoard(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); //���α� ���� 
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); //�Խ��� �� ���
	public List<HashMap<String, Object>> selectByCategory(HashMap<String, Object> params);

}
