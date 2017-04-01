package java.dao.boardtraveldao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;

public interface IBoardTravel {
	
	public int insertBoardTravel(BoardVo boardVo);
	public int updateBoardTravel(BoardVo boardVo);
	public int deleteBoardTravel(int b_idx);
	public HashMap<String, Object> selectTravelOne(int b_idx);
	public List<HashMap<String, Object>> selectTravelByCode();
	public List<HashMap<String, Object>> selectTravelByLoc_Category(String b_loc_category);
	public List<HashMap<String, Object>> selectTravelBySub_Category(String b_sub_category);
	public BoardVo selectTravelByLimit(HashMap<String, Object> params); 
	public int getCountTravel();
	 
}
