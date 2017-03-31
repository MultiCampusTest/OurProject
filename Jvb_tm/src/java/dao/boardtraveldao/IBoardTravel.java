package java.dao.boardtraveldao;

import java.util.HashMap;
import java.util.List;

public interface IBoardTravel {
	
	public int insertBoardTravel(HashMap<String, Object> params);
	public int updateBoardTravel(HashMap<String, Object> params);
	public int deleteBoardTravel(int b_idx);
	public HashMap<String, Object> selectTravelOne(int b_idx); 
	public List<HashMap<String, Object>> selectTravelByLoc_Category(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectTravelBySub_Category(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); 
	public int getCountTravel();
	 
}
