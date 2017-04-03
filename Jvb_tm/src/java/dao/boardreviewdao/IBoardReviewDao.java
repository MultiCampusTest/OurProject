package java.dao.boardreviewdao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;
import java.vo.ContentsVo;
import java.vo.ImageVo;

public interface IBoardReviewDao {
	
	public int insertReviewBoard(BoardVo boardVo);
	public int insertImage(ImageVo imageVo);
	public int insertContents(ContentsVo contens);
	public int updateReviewBoard(BoardVo boardVo);
	public int updateImage(ImageVo imageVo);
	public int updateContents(ContentsVo contents);
	public int deleteReviewBoard(int b_idx);
	public HashMap<String, Object> selectReviewOne(int b_idx); //세부글 보기 
	public List<HashMap<String, Object>> selectReivewByCode(); //게시판 별 목록
	public List<HashMap<String, Object>> selectReviewByLocCategory(String b_loc_category);
	public List<HashMap<String, Object>> selectReviewBySubCategory(String b_sub_category);
	public List<HashMap<String, Object>> selectReviewByLimit(HashMap<String, Object> params);
	public int getCountReview();
	public HashMap<String, Object> selectContents(int b_idx);
}
