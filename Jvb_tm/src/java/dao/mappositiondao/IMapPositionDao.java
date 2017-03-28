package dao;

import java.util.HashMap;
import java.util.List;

public interface IMapPositionDao {

	public int insertMapPosition(HashMap<String, Object> params);
//	public int updateMapPosition(MapPosition mapPosition);
	public int deleteMapPosition(int b_idx);
	public List<HashMap<String, Object>> selectByIdx(int b_idx);
	
}
