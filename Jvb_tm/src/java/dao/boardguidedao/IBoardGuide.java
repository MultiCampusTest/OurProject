package java.dao.boardguidedao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;
import java.vo.ContentsVo;
import java.vo.ImageVo;

public interface IBoardGuide {

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

}
