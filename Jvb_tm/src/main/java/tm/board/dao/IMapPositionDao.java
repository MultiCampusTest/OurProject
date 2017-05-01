package tm.board.dao;

import java.util.List;

import tm.board.vo.MapPositionVo;

public interface IMapPositionDao {
	
	public int mapPositionInsert(MapPositionVo mapPositionVo);
	public int mapPositionDelete(int b_idx);
	public List<MapPositionVo> mapPositionSelectOne(int b_idx);
	

}
