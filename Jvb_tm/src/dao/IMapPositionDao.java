package dao;

public interface IMapPositionDao {

	public int insertMapPosition(MapPosition mapPosition);
//	public int updateMapPosition(MapPosition mapPosition);
	public int deleteMapPosition(int b_idx);
	public List<MapPosition> selectByIdx(int b_idx);
	
}
