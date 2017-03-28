package dao;

import java.util.HashMap;
import java.util.List;

public interface IContentsDao {
	
	public int insertContents(HashMap<String, Object> params);
	public int updateContents(HashMap<String, Object> params);
	public int deleteContents(int b_idx);
	public List<HashMap<String, Object>> selectByIdx(int b_idx);

}
