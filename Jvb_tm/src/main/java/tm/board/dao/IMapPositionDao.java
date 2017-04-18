package tm.board.dao;

import java.util.List;

import tm.commons.vo.MapPositionVo;

public interface IMapPositionDao {
	
	public int insertMapPosition(MapPositionVo mapPositionVo);
	public int deleteMapPosition(int b_idx);
	public List<MapPositionVo> selectMapPositionOne(int b_idx);
	

}
