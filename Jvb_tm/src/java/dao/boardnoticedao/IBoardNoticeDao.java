package java.dao.boardnoticedao;

import java.util.HashMap;
import java.util.List;

public interface IBoardNoticeDao {
	
	public int insertBoardNotice(HashMap<String, Object> params);
	public int updateBoardNotice(HashMap<String, Object> params);
	public int deleteBoardNotice(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx);
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); 
	public List<HashMap<String, Object>> selectNoticeByLimit(HashMap<String, Object> params);
	public int getCountNotice();
	
}
