package dao;

public interface IBoardDao {
	
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int b_idx);
	public Board selectOne(int b_idx); //세부글 보기 
	public List<Board> selectByCode(String code); //게시판 별 목록
	public List<Board> selectByCategory(String code, String category);
	
}
