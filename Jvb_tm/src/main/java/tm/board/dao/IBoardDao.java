package tm.board.dao;

import java.util.HashMap;
import java.util.List;

import tm.board.commons.BoardVo;
import tm.board.commons.CommentsVo;
import tm.commons.vo.ContentsVo;
import tm.commons.vo.ImageVo;
import tm.commons.vo.MapPositionVo;


public interface IBoardDao {
	
	//guide
	public int insertBoardGuide(BoardVo boardVo);
	public int insertImage(ImageVo imageVo);
	public int insertContents(ContentsVo contens);
	public int updateBoardGuide(BoardVo boardVo);
	public int updateImage(ImageVo imageVo);
	public int updateContents(ContentsVo contents);
	public int deleteBoardGuide(int b_idx);
	public HashMap<String, Object> selectGuideOne(int b_idx); 
	public List<HashMap<String, Object>> selectGuideByCode(); 
	public List<HashMap<String, Object>> selectGuideByLocCategory(String b_loc_category);
	public List<HashMap<String, Object>> selectGuideBySubCategory(String b_sub_category);
	public List<HashMap<String, Object>> selectGuideByLimit(HashMap<String, Object> params);
	public int getCountGuide();
	public HashMap<String, Object> selectContents(int b_idx);
	
	//notice
	public int insertBoardNotice(BoardVo boardVo);
	public int insertContentsNotice(ContentsVo contentsVo);
	public int updateBoardNotice(BoardVo boardVo);
	public int updaetContentsNotice(ContentsVo contentsVo);
	public int deleteBoardNotice(int b_idx);
	public int deleteContentsNotice(int b_idx);
	public BoardVo selectNoticeOne(int b_idx);
	public ContentsVo selectContentsNoticeOne(int b_idx);
	public List<BoardVo> selectNoticeBySearch(HashMap<String, Object> params);
	public List<BoardVo> selectByCode(); 
	public List<BoardVo> selectNoticeByLimit(HashMap<String, Object> params);
	public int getCountNotice();
	
	//review
	public int insertReviewBoard(BoardVo boardVo);
//	public int insertImage(ImageVo imageVo);
//	public int insertContents(ContentsVo contens);
	public int updateReviewBoard(BoardVo boardVo);
//	public int updateImage(ImageVo imageVo);
//	public int updateContents(ContentsVo contents);
	public int deleteReviewBoard(int b_idx);
	public HashMap<String, Object> selectReviewOne(int b_idx); //���α� ���� 
	public List<HashMap<String, Object>> selectReivewByCode(); //�Խ��� �� ���
	public List<HashMap<String, Object>> selectReviewByLocCategory(String b_loc_category);
	public List<HashMap<String, Object>> selectReviewBySubCategory(String b_sub_category);
	public List<HashMap<String, Object>> selectReviewByLimit(HashMap<String, Object> params);
	public int getCountReview();
//	public HashMap<String, Object> selectContents(int b_idx);
	
	//travel
	public int insertBoardTravel(BoardVo boardVo);
	public int insertContentsTravel(ContentsVo contentsVo);
	public int insertImageTravel(ImageVo imageVo);
	public int insertMapPositionTravel(MapPositionVo mapPositionVo);
	public int updateBoardTravel(BoardVo boardVo);
	public int updateImageTravel(ImageVo imageVo);
	public int deleteBoardTravel(int b_idx);
	public int deleteContentsTravel(int b_idx);
	public int deleteImageTravel(int img_idx);
	public int deleteMapPositionTravel(int b_idx);
	public HashMap<String, Object> selectTravelOne(int b_idx);
	public List<ContentsVo> selectContentsTravelOne(int b_idx);
	public List<MapPositionVo> selectMapPositionTravelOne(int b_idx);
	public List<HashMap<String, Object>> selectTravelByCode();
	public List<HashMap<String, Object>> selectTravelByLoc_Category(String b_loc_category);
	public List<HashMap<String, Object>> selectTravelBySub_Category(String b_sub_category);
	public List<BoardVo> selectTravelByLimit(HashMap<String, Object> params); 
	public int getCountTravel();
	
	//comments
	public int insertComments(CommentsVo commentsVo);
//	public int updateComments(HashMap<String, Object> params);
//	public int deleteComments(int b_idx, int c_idx);
//	public List<HashMap<String, Object>> selectCommentsByIdx(int b_idx);

}
