package tm.board.dao;

import java.util.List;

import tm.board.vo.MapPositionVo;

public interface IMapPositionDao {
	
	public int insertMapPosition(MapPositionVo mapPosition);
	public List<MapPositionVo> selectMapPosition(int boardIdx);
	
//	public int deleMapPosition(int b_idx);
//	public List<MapPositionVo> selectMapPosition(int b_idx);
	

}
