package dao;

import java.util.HashMap;
import java.util.List;

public interface IBoardDao {
	
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);
	public int deleteBoard(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); //세부글 보기 
	public List<HashMap<String, Object>> selectByCode(String code); //게시판 별 목록
	public List<HashMap<String, Object>> selectByCategory(String code, String category);
	
}
