package java.dao.boardnoticedao;

import java.util.HashMap;
import java.util.List;

public interface IBoardNoticeDao {
	
	public int insertBoardNotice(HashMap<String, Object> params);
	public int updateBoardNotice(HashMap<String, Object> params);
	public int deleteBoardNotice(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); //세부글 보기 
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); //게시판 별 목록
}
