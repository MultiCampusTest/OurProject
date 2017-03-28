package java.dao.boardtraveldao;

import java.util.HashMap;
import java.util.List;

public interface IBoardTravel {
	
	public int insertBoardTravel(HashMap<String, Object> params);
	public int updateBoardTravel(HashMap<String, Object> params);
	public int deleteBoardTravel(int b_idx);
	public HashMap<String, Object> selectOne(int b_idx); //���α� ���� 
	public List<HashMap<String, Object>> selectByCode(HashMap<String, Object> params); //�Խ��� �� ���
	public List<HashMap<String, Object>> selectByCategory(HashMap<String, Object> params);

}
