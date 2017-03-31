package java.dao.boardguidedao;

import java.util.HashMap;
import java.util.List;

public interface IBoardGuide {

	public int insertBoardGuide(HashMap<String, Object> params);
	public int updateBoardGuide(HashMap<String, Object> params);
	public int deleteBoardGuide(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); //세부글 보기 
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); //게시판 별 목록
	public List<HashMap<String, Object>> selectByCategory(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectGuideByLimit(HashMap<String, Object> params);
	public int getCountGuide();

}
