package java.dao.boardguidedao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;

public interface IBoardGuide {

	public int insertBoardGuide(BoardVo boardVo);
	public int updateBoardGuide(BoardVo boardVo);
	public int deleteBoardGuide(int b_idx);
	public HashMap<String, Object> selectGuideOne(int b_idx); 
	public List<HashMap<String, Object>> selectGuideByCode(); 
	public List<HashMap<String, Object>> selectGuideByLocCategory(String b_loc_category);
	public List<HashMap<String, Object>> selectGuideBySubCategory(String b_sub_category);
	public List<HashMap<String, Object>> selectGuideByLimit(HashMap<String, Object> params);
	public int getCountGuide();

}
