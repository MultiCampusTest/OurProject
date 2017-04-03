package java.dao.boardtraveldao;

import java.util.HashMap;
import java.util.List;
import java.vo.BoardVo;
import java.vo.ContentsVo;
import java.vo.ImageVo;
import java.vo.MapPositionVo;

public interface IBoardTravelDao {
	
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
	
	
}
