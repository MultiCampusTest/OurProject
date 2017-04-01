package java.dao.boardreviewdao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;

public interface IBoardReviewDao {
	
	public int insertReviewBoard(BoardVo boardVo);
	public int updateReviewBoard(BoardVo boardVo);
	public int deleteReviewBoard(int b_idx);
	public HashMap<String, Object> selectReviewOne(int b_idx); //���α� ���� 
	public List<HashMap<String, Object>> selectReivewByCode(); //�Խ��� �� ���
	public List<HashMap<String, Object>> selectReviewByLocCategory(String b_loc_category);
	public List<HashMap<String, Object>> selectReviewBySubCategory(String b_sub_category);
	public List<HashMap<String, Object>> selectReviewByLimit(HashMap<String, Object> params);
	public int getCountReview();
}
