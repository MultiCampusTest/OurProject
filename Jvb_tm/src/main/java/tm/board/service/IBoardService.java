package tm.board.service;

import java.util.HashMap;
import java.util.List;

import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.ContentsVo;
import tm.image.vo.ImageVo;

public interface IBoardService {
	//�Խñ� �ۼ�
	public void writeNotice(BoardVo board, ContentsVo contents);
	public void writeGuide(BoardVo board, ImageVo image, ContentsVo contents);
	public void writeTravel(BoardVo board, ImageVo image, ContentsVo contens);
	public void wirteReview(BoardVo board, ImageVo imge, ContentsVo contents);
	public void writeComments(CommentsVo comments);
	
	//�Խñ� ����
	public void modifyNotice(BoardVo board, ContentsVo contents);
	public void modifyGuide(BoardVo board, ImageVo image, ContentsVo contents);
	public void modifyTravel(BoardVo board, ImageVo image, ContentsVo contents);
	public void modifyReview(BoardVo board, ImageVo image, ContentsVo contents);
	public void modifyComments(CommentsVo comments);
	
	//�Խñ� ����
	public boolean boardDelete(int b_idx);
	
	//�� �Խñ� �Ѱ�
	public HashMap<String, Object> selectOneNotice(int b_idx, int ct_idx);
	public HashMap<String, Object> selectOneGuide(int b_idx, int img_idx, int ct_idx);
	public HashMap<String, Object> selectOneTrabel(int b_idx, int img_idx, int ct_idx);
	public HashMap<String, Object> selectOneReview(int b_idx, int img_idx, int ct_idx);
	
	//�� �Խñ� ��� ����Ʈ ���
	public List<HashMap<String, Object>> selectComments(int b_idx);
	
	//�Խ��Ǻ� ����Ʈ ���
	public List<HashMap<String, Object>> selectAllNotice(int b_code, int b_idx, int page);
	public List<HashMap<String, Object>> selectAllGuide(int b_code, int b_idx, int page);
	public List<HashMap<String, Object>> selectAllTravel(int b_code, int b_idx, int page);
	public List<HashMap<String, Object>> selectAllReview(int b_code, int b_idx, int page);
	
	//�Խñ� ��ȸ
	public HashMap<String, Object> readBoard(int b_idx);

}
