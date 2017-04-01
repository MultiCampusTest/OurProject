package java.dao.mappositiondao;

import java.util.HashMap;
import java.util.List;

import java.vo.MapPositionVo;

public interface IMapPositionDao {
   public int insertMapPosition(MapPositionVo mapPositionVo);

   // public int updateMapPosition(MapPosition mapPosition);
   public int deleteMapPosition(int b_idx);

   public List<HashMap<String, Object>> selectByIdx(int b_idx);
}
