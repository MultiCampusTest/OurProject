package tm.board.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public HashMap<String, Object> getNoticeBoardList(String code, int page, String searchValue){
		
		System.out.println(searchValue);
		//시작과 끝페이지
		int start = (page - 1) / 10 * 10 + 1; 
		int end = ((page - 1) / 10 + 1) * 10;
		
		//첫페이지와 게시물 전체의 마지막 페이지
		int first = 1;
		
		HashMap<String, Object> boardCountParams = new HashMap<>();
		boardCountParams.put("code", code);
		boardCountParams.put("searchValue", searchValue);
		int last = (boardDao.getNoticeBoardCount(boardCountParams) - 1) / 10 + 1;
		
		end = last < end ? last : end;
		
		int skip = (page - 1) * 10;
		int count = 10;
		HashMap<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("searchValue", searchValue);
		params.put("skip", skip);
		params.put("count", count);
		List<BoardVo> list = boardDao.selectNoticeBoardLimit(params);

		
		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("searchValue", searchValue);
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
	public HashMap<String, Object> getCommonBoardList(String code, int page, String locCategory, String subCategory){
		
		//시작과 끝페이지
		int start = (page - 1) / 10 * 10 + 1; 
		int end = ((page - 1) / 10 + 1) * 10;
		
		//첫페이지와 게시물 전체의 마지막 페이지
		int first = 1;
		HashMap<String, Object> boardCountParams = new HashMap<>();
		boardCountParams.put("code", code);
		boardCountParams.put("locCategory", locCategory);
		boardCountParams.put("subCategory", subCategory);
		int last = (boardDao.getCommonBoardCount(boardCountParams) - 1) / 6 + 1;
		
		end = last < end ? last : end;
		
		int skip = (page - 1) * 6;
		int count = 6;
		HashMap<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("locCategory", locCategory);
		params.put("subCategory", subCategory);
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
		}
		
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("count", boardDao.getCommonBoardCount(boardCountParams));
		result.put("locCategory", locCategory);
		result.put("subCategory", subCategory);
		result.put("list", list);

		return result;
	}
	
	//날짜 차이 계산
	public int getDiffOfDate(String start, String end){	     
		
		int result = 0;
		try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        Date beginDate = formatter.parse(start);
	        Date endDate = formatter.parse(end);
	         
	        long diff = endDate.getTime() - beginDate.getTime();
	        long diffDays = diff / (24 * 60 * 60 * 1000);
	        
	        result = (int)(diffDays+1);
	        
	         
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		return result;
	}

	
	
	//guide
	public void insertGuide(String userid, BoardVo board, ContentsVo contents, String[] latLngArr ){
		
		board.setUserid(userid);
		int diffDays = getDiffOfDate(board.getStartDate(), board.getEndDate());
		
		if(diffDays == 1){
			board.setSubCategory("one");
		}else if(diffDays == 2){
			board.setSubCategory("two");
		}else if(diffDays == 3){
			board.setSubCategory("three");
		}else if(diffDays == 4){
			board.setSubCategory("four");
		}else{
			board.setSubCategory("guide_more");
		}
		
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
	public void insertReview(BoardVo board, ContentsVo contents, MultipartHttpServletRequest req){
		boardDao.insertBoard(board);
		int boardIdx = board.getBoardIdx();

		contents.setBoardIdx(boardIdx);
		contentsDao.insertContents(contents);
		
		String path= "/Users/LeeGilSun/upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		List<MultipartFile> files = req.getFiles("file");
		
		for(int i=0; i<files.size(); i++){
			UUID uuid = UUID.randomUUID();
			String fileName = files.get(i).getOriginalFilename();
			int fileSize = (int) files.get(i).getSize();
			String fileuri = path + uuid;
			
			ImageVo image = new ImageVo();
			image.setImg_ori_name(fileName);
			image.setImg_code(Integer.toString(boardIdx));
			image.setImg_path(fileuri);
			
			File localFile = new File(fileuri);
			try{
				files.get(i).transferTo(localFile);
			} catch (IllegalStateException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			imageDao.insertImage(image);
		}
	}
	
	//리뷰 리스트 불러오기
	public HashMap<String, Object> getReviewBoardList(String code, int page, String searchValue){
		
		System.out.println(searchValue);
		//시작과 끝페이지
		int start = (page - 1) / 10 * 10 + 1; 
		int end = ((page - 1) / 10 + 1) * 10;
		
		//첫페이지와 게시물 전체의 마지막 페이지
		int first = 1;
		
		HashMap<String, Object> boardCountParams = new HashMap<>();
		boardCountParams.put("code", code);
		boardCountParams.put("searchValue", searchValue);
		int last = (boardDao.getReviewBoardCount(boardCountParams) - 1) / 10 + 1;
		
		end = last < end ? last : end;
		
		int skip = (page - 1) * 6;
		int count = 6;
		HashMap<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("searchValue", searchValue);
		params.put("skip", skip);
		params.put("count", count);
		List<BoardVo> list = boardDao.selectReviewBoardLimit(params);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("searchValue", searchValue);
		result.put("list", list);

		return result;
	}
	
	//리뷰 세부글 일기 
	public HashMap<String, Object> readReview(int boardIdx){
		BoardVo board = boardDao.selectOneBoard(boardIdx);
		board.setReadCount(board.getReadCount() + 1);
		boardDao.readReview(boardIdx);
		
		ContentsVo contents = contentsDao.selectOneContents(boardIdx);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("review", board);
		result.put("contents", contents);
		return result;
	}
	
	
	
	
	
}
