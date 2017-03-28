package java.dao.boardtraveldao;

import java.util.HashMap;
import java.util.List;

public interface IBoardTravel {
	
	public int insertBoardTravel(HashMap<String, Object> params);
	public int updateBoardTravel(HashMap<String, Object> params);
	public int deleteBoardTravel(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); //세부글 보기 
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); //게시판 별 목록
	public List<HashMap<String, Object>> selectByCategory(HashMap<String, Object> params);

}
