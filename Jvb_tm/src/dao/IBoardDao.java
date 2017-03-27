package dao;

public interface IBoardDao {
	
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int b_idx);
	public Board selectOne(int b_idx); //���α� ���� 
	public List<Board> selectByCode(String code); //�Խ��� �� ���
	public List<Board> selectByCategory(String code, String category);
	
}
