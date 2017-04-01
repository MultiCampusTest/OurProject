package java.dao.contentsdao;

import java.util.HashMap;
import java.util.List;

import java.vo.ContentsVo;

public interface IContentsDao {
   public int insertContents(ContentsVo contentsVo);

   public int updateContents(ContentsVo contentsVo);

   public int deleteContents(int b_idx);

   public List<HashMap<String, Object>> selectByIdx(int b_idx);
}