package tm.board.service;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.ContentsVo;
import tm.board.vo.MapPositionVo;
import tm.image.vo.ImageVo;

public interface IBoardService {
	//게시글 작성
	public void writeNotice(BoardVo board, ContentsVo contents);
	public void writeGuide(BoardVo board, ImageVo image, ContentsVo contents, MapPositionVo mapPosition);
	public void writeTravel(BoardVo board, ImageVo image, ContentsVo contens, MapPositionVo mapPosition);
	public void wirteReview(BoardVo board, ImageVo imge, ContentsVo contents, MapPositionVo mapPosition);
	public void writeComments(CommentsVo comments);
	
	//게시글 수정
	public void modifyNotice(BoardVo board, ContentsVo contents);
	public void modifyGuide(BoardVo board, ImageVo image, ContentsVo contents, MapPositionVo mapPosition);
	public void modifyTravel(BoardVo board, ImageVo image, ContentsVo contents, MapPositionVo mapPosition);
	public void modifyReview(BoardVo board, ImageVo image, ContentsVo contents, MapPositionVo mapPosition);
	public void modifyComments(CommentsVo comments);
	
	//게시글 삭제
	public boolean boardDelete(int b_idx);
	
	//게시글 1개 검색
	public HashMap<String, Object> selectOneNotice(int b_idx, int ct_idx);
	public HashMap<String, Object> selectOneGuide(int b_idx, int img_idx, int ct_idx);
	public HashMap<String, Object> selectOneTrabel(int b_idx, int img_idx, int ct_idx);
	public HashMap<String, Object> selectOneReview(int b_idx, int img_idx, int ct_idx);
	
	//게시글 별 댓글 리스트 검색
	public List<HashMap<String, Object>> selectComments(int b_idx);
	
	//게시판별 게시글 리스트 검색
	public List<HashMap<String, Object>> selectAllNotice(int b_code, int b_idx, int page);
	public List<HashMap<String, Object>> selectAllGuide(int b_code, int b_idx, int page);
	public List<HashMap<String, Object>> selectAllTravel(int b_code, int b_idx, int page);
	public List<HashMap<String, Object>> selectAllReview(int b_code, int b_idx, int page);
	
	//게시글 조회
	public HashMap<String, Object> readBoard(int b_idx);

}
