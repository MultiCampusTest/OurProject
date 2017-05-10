package tm.board.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tm.board.dao.IBoardDao;
import tm.board.dao.ICommentsDao;
import tm.board.dao.IContentsDao;
import tm.board.dao.IMapPositionDao;
import tm.board.vo.BoardVo;
import tm.board.vo.ContentsVo;
import tm.board.vo.MapPositionVo;
import tm.image.dao.IImageDao;
import tm.image.vo.ImageVo;

@Service
public class BoardService {
	
	//
	@Autowired
	private IBoardDao boardDao;
	
	@Autowired
	private ICommentsDao commenstDao;
	
	@Autowired
	private IContentsDao contentsDao;
	
	@Autowired
	private IImageDao imageDao;
	
	@Autowired
	private IMapPositionDao mapPositionDao;
	
	//notice
	//공지사항 쓰기
	public void insertNotice(BoardVo board, ContentsVo contents){
		boardDao.insertBoard(board);
		int boardIdx = board.getBoardIdx();
		
		contents.setBoardIdx(boardIdx);
		contentsDao.insertContents(contents);
	}
	
	//공지사항 업데이트
	public void updateNotice(BoardVo board, ContentsVo contents){
		boardDao.updateNotice(board);
		contentsDao.updateContents(contents);		
	}
	
	//공지사항 리스트 얻어오기
	public HashMap<String, Object> getNoticeBoardList(String code, int page){
		//시작과 끝페이지
		int start = (page - 1) / 10 * 10 + 1; 
		int end = ((page - 1) / 10 + 1) * 10;
		
		//첫페이지와 게시물 전체의 마지막 페이지
		int first = 1;
		int last = (boardDao.getBoardCountByCode(code) - 1) / 10 + 1;
		
		end = last < end ? last : end;
		
		int skip = (page - 1) * 10;
		int count = 10;
		HashMap<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("skip", skip);
		params.put("count", count);
		List<BoardVo> list = boardDao.selectNoticeBoardLimit(params);

		
		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("noticeList", list);

		return result;
	}
	
	//공지사항 세부글 읽기
	public HashMap<String, Object> readNotice(int boardIdx){
		BoardVo board = boardDao.selectOneBoard(boardIdx);
		board.setReadCount(board.getReadCount()+1);
		boardDao.updateNotice(board);
		ContentsVo contents = contentsDao.selectOneContents(boardIdx);
		contents.setContents(contents.getContents().replace("\r\n",	"<br>"));
		contents.setContents(contents.getContents().replace("\u0020", "&nbsp"));
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("notice", board);
		result.put("contents", contents);
		
		return result;	
	}
	
	//공지사항 세부글 가져오기(수정시)
	public HashMap<String, Object> getNotice(int boardIdx) {
		BoardVo board = boardDao.selectOneBoard(boardIdx);
		ContentsVo contents = contentsDao.selectOneContents(boardIdx);		

		HashMap<String, Object> result = new HashMap<>();
		result.put("notice", board);
		result.put("contents", contents);
		
		return result;
	}

	//guide, travel 리스트 얻어오기
	public HashMap<String, Object> getCommonBoardList(String code, int page){
		//시작과 끝페이지
		int start = (page - 1) / 10 * 10 + 1; 
		int end = ((page - 1) / 10 + 1) * 10;
		
		//첫페이지와 게시물 전체의 마지막 페이지
		int first = 1;
		int last = (boardDao.getBoardCountByCode(code) - 1) / 6 + 1;
		
		end = last < end ? last : end;
		
		int skip = (page - 1) * 6;
		int count = 6;
		HashMap<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("skip", skip);
		params.put("count", count);
		List<BoardVo> list = boardDao.selectCommonBoardLimit(params);
		
		for(int i=0; i<list.size(); i++){
			int idx = list.get(i).getBoardIdx();
			List<MapPositionVo> mapPositionArr = mapPositionDao.selectMapPosition(idx);
			
			String strLatLng = "";
			for(int j=0; j<mapPositionArr.size(); j++){
					String latLng = mapPositionArr.get(j).getLatLng();
						   latLng = latLng.replace("(", "");
						   latLng = latLng.replace(")", "");
					strLatLng += latLng + "|";	   
				    mapPositionArr.get(j).setLatLng(latLng);
			}
			
			strLatLng = strLatLng.substring(0, strLatLng.length()-1);
			String startLatLng = mapPositionArr.get(0).getLatLng();
			String endLatLng = mapPositionArr.get(mapPositionArr.size()-1).getLatLng();
			
			list.get(i).setStrLatLng(strLatLng);
			list.get(i).setStartLatLng(startLatLng);
			list.get(i).setEndLatLng(endLatLng);
//			System.out.println(strLatLng);
//			System.out.println(startLatLng);
//			System.out.println(endLatLng);
		}
		
		
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("list", list);

		return result;
	}
	
	
	//guide
	public void insertGuide(String userid, BoardVo board, ContentsVo contents, String[] latLngArr ){
		
		board.setUserid(userid);
		boardDao.insertBoard(board);
		int boardIdx = board.getBoardIdx();
		
		contents.setBoardIdx(boardIdx);
		contentsDao.insertContents(contents);
		
		for(int i=0; i<latLngArr.length; i++){
			MapPositionVo mapPosition = new MapPositionVo();
			mapPosition.setBoardIdx(boardIdx);
			mapPosition.setLatLng(latLngArr[i]);
			mapPosition.setMarkerSeq(i);
			mapPositionDao.insertMapPosition(mapPosition);
		}
	}
	
	public HashMap<String, Object> readGuide(int boardIdx){
		BoardVo board = boardDao.selectOneBoard(boardIdx);
		board.setReadCount(board.getReadCount()+1);
		boardDao.updateGuide(board);
		ContentsVo contents = contentsDao.selectOneContents(boardIdx);
		List<MapPositionVo> mapPositionArr = mapPositionDao.selectMapPosition(boardIdx);
		
		for(int i=0; i<mapPositionArr.size();i++){
			String loc  = mapPositionArr.get(i).getLatLng();
			loc = loc.replace("(", "");
			loc = loc.replace(")", "");
			mapPositionArr.get(i).setLatLng(loc);
		}

		HashMap<String, Object> result = new HashMap<>();
		result.put("guide", board);
		result.put("contents", contents);
		result.put("mapPosition", mapPositionArr);
		return result;	
	}
	
	//review insert
	public void insertReview(BoardVo board, ContentsVo contents, MultipartFile file){
		boardDao.insertBoard(board);
		int boardIdx = board.getBoardIdx();

		contents.setBoardIdx(boardIdx);
		contentsDao.insertContents(contents);
		
		String path= "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		UUID uuid = UUID.randomUUID();
		String fileName = file.getOriginalFilename();
		int fileSize = (int)file.getSize();
		String fileuri = path + uuid;

		ImageVo image = new ImageVo();
		image.setImg_ori_name(fileName);
		image.setImg_code(boardIdx);
		image.setImg_path(fileuri);

		File localFile = new File(fileuri);
		try{
			file.transferTo(localFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		}  catch(IOException e) {
			e.printStackTrace();
		} 

		imageDao.insertImage(image);
		boardDao.insertBoard(board);	
	}
	
	
	
	
}
