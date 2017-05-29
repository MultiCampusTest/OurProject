 package tm.board.web;
 
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import tm.board.service.BoardService;
import tm.board.service.CommentsService;
import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.ContentsVo;
import tm.image.service.ImageService;
import tm.image.vo.ImageVo;
import tm.matching.service.IMatchingService;
import tm.matching.vo.MatchingVo;
import tm.message.service.IMessageService;
import tm.message.vo.MessageVo;

@Controller
public class BoardController {
	  
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private IMatchingService matchingService;
	
	@Autowired
	private IMessageService messageService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String maindo(){
		return "redirect:main.do";
	}
	//메인화면
	@RequestMapping(value="main.do")
	public String main() {
		return "middle";
	} 

	// notice_board
	@RequestMapping(value="noticeList.do")
	public ModelAndView noticeList(HttpServletRequest req,
								   @RequestParam(defaultValue="1") int page, 
								   String searchValue) {
		String code = "n";
		String userid = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getNoticeBoardList(code, page, searchValue));
		mav.addObject("userid", userid);
		mav.setViewName("board/notice_list");
		return mav;
	}
	
	@RequestMapping(value="noticeWriteForm.do")
	public String noticeWriteForm(String userid) {
		if(userid.equals("admin")){
			return "board/notice_write_form"; 
		} else {
			return "board/notice_list";
		}
	}
	
	@RequestMapping(value="noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite(BoardVo board, ContentsVo contents){
		boardService.insertNotice(board, contents);
		return "redirect:noticeView.do?boardIdx="+board.getBoardIdx();
	}
	
	@RequestMapping(value="noticeView.do")
	public ModelAndView noticeView(HttpServletRequest req, int boardIdx, int page, String searchValue) {
		String userid = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.readNotice(boardIdx));
		mav.addObject("userid", userid);
		mav.addObject("page", page);
		mav.addObject("searchValue", searchValue);
//		mav.addObject("comments",commentsService.selectComments(boardIdx)); 
		mav.setViewName("board/notice_view");
		
		return mav;
	}
	
	@RequestMapping(value="noticeModifyForm.do")
	public ModelAndView noticeModifyForm(int boardIdx) {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getNotice(boardIdx));
		mav.setViewName("board/notice_modify_form");
		return mav;		
	}
	
	@RequestMapping(value="noticeModify.do", method=RequestMethod.POST)
	public String noticeModify(BoardVo board, ContentsVo contents){
		boardService.updateNotice(board, contents);
		return "redirect:noticeView.do?boardIdx="+board.getBoardIdx();
	}
	
	

	
	

	

	// travel_board
	@RequestMapping(value="travelList.do")
	public ModelAndView travelList(
			@RequestParam(defaultValue="1") int page,
			 String locCategory,
			 String subCategory
			) {
		
		String code = "t";
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getCommonBoardList(code, page, locCategory, subCategory));
		mav.setViewName("board/travel_list");
		return mav;
	}

	@RequestMapping(value="travelWriteForm.do")
	public String travelWriteForm() {
		return "board/travel_write_form";
	}
	
	@RequestMapping(value="travelWrite.do", method=RequestMethod.POST)
	public String travelWrite(
			HttpServletRequest req,
			BoardVo board){
		String[] contentsArr =req.getParameterValues("contents");
		String[] latLngArr = req.getParameterValues("latLng");
		String userid = (String)(req.getSession().getAttribute("userid"));
		
		boardService.insertTravel(userid, board, contentsArr, latLngArr);
		return "redirect:travelView.do?boardIdx="+board.getBoardIdx();
				
	}
	
	@RequestMapping("travelView.do")
	public ModelAndView travelView(HttpServletRequest req, int boardIdx) {
		
		String userid = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.readTravel(boardIdx));
		mav.addObject("userid", userid);
		mav.addObject("comments",commentsService.selectComments(boardIdx)); 
		mav.addObject("matchingComplete", matchingService.matchingComplete(boardIdx));
		mav.setViewName("board/travel_view");
		
		return mav;
	}

	
	@RequestMapping("travelModifyForm.do")
	public ModelAndView travelModifyForm(int boardIdx) {
		
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getTravel(boardIdx));
		mav.setViewName("board/travel_modify_form");
		return mav;
	}

	@RequestMapping(value="travelModify.do", method=RequestMethod.POST)
	public String travelModify(HttpServletRequest req,
							   BoardVo board){
				
				String[] contentsArr =req.getParameterValues("contents");
				String[] latLngArr = req.getParameterValues("latLng");
					
				boardService.updateTravel(board, contentsArr, latLngArr);
				return "redirect:travelView.do?boardIdx="+board.getBoardIdx();
	}
	
	@RequestMapping(value="travelDelete.do", method=RequestMethod.GET)
	public String travelDelete(int boardIdx){
				boardService.deleteTravel(boardIdx);
				return "redirect:travelList.do";
	}
	
	
	// guide_board
	@RequestMapping(value="guideList.do")
	public ModelAndView guideList(
		 @RequestParam(defaultValue="1") int page,
		 String locCategory,
		 String subCategory
		 ){
		String code = "g";
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getCommonBoardList(code, page, locCategory, subCategory));
		mav.setViewName("board/guide_list");
		return mav;
	}
	
	@RequestMapping("guideWriteForm.do")
	public String guideWriteForm() {
		return "board/guide_write_form";
	}
	
	@RequestMapping(value="guideWrite.do", method=RequestMethod.POST)
	public String guideWrite(
			HttpServletRequest req,
			BoardVo board,
			ContentsVo contents){
		
		String[] latLngArr = req.getParameterValues("latLng");
		String userid = (String)(req.getSession().getAttribute("userid"));
		
		boardService.insertGuide(userid, board, contents, latLngArr);
		return "redirect:guideView.do?boardIdx="+board.getBoardIdx();
		
	}

	@RequestMapping("guideView.do")
	public ModelAndView guideView(HttpServletRequest req, int boardIdx) {
		
		String userid = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.readGuide(boardIdx));
		mav.addObject("userid", userid);
		mav.addObject("comments",commentsService.selectComments(boardIdx)); 
		mav.addObject("matchingComplete", matchingService.matchingComplete(boardIdx));
		mav.setViewName("board/guide_view");

		
		return mav;
	}

	@RequestMapping("guideModifyForm.do")
	public ModelAndView guideModifyForm(int boardIdx) {
		
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getGuide(boardIdx));
		mav.setViewName("board/guide_modify_form");
		return mav;		
	}
	
	@RequestMapping(value="guideModify.do", method=RequestMethod.POST)
	public String guideModify(HttpServletRequest req,
							  BoardVo board,
							  ContentsVo contents){
				String[] latLngArr = req.getParameterValues("latLng");
		
				boardService.updateGuide(board, contents, latLngArr);
				return "redirect:guideView.do?boardIdx="+board.getBoardIdx();
	}
	
	@RequestMapping(value="guideDelete.do", method=RequestMethod.GET)
	public String guideDelete(int boardIdx){
				boardService.deleteGuide(boardIdx);
				return "redirect:guideList.do";
	}
	



	// review_board
	@RequestMapping("reviewList.do")
	public ModelAndView reviewList(
			@RequestParam(defaultValue="1") int page,
			String searchValue,
			String subCategory) {
		String code = "r";
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getReviewBoardList(code, page, searchValue, subCategory));
		mav.setViewName("board/review_list");
		return mav;
	}
	
	@RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm() {
		return "board/review_write_form";
	}
	
	@RequestMapping(value="reviewWrite.do")
	@ResponseBody
	public ModelAndView reviewWrite(BoardVo board, ContentsVo contents, @RequestParam("ufile") MultipartFile file) {
		boardService.insertReview(board, contents);
		imageService.insertReviewImg(board, file);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:reviewView.do?boardIdx="+board.getBoardIdx());
		return mav;
	}


	@RequestMapping("reviewView.do")
	public ModelAndView reviewView(HttpServletRequest req, int boardIdx) {
		String userid = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		List<ImageVo> list = imageService.selectView(boardIdx);

		mav.addObject("userid", userid);
		mav.addAllObjects(boardService.readReview(boardIdx));
		mav.addObject("reviewImage", list);
		mav.addObject("comments",commentsService.selectComments(boardIdx)); 
		mav.setViewName("board/review_view");
		
		return mav;
	}

	@RequestMapping("reviewModifyForm.do")
	public ModelAndView reviewModifyForm(int boardIdx) {
		ModelAndView mav = new ModelAndView();
		
		mav.addAllObjects(boardService.getReview(boardIdx));
		mav.addObject("image", imageService.selectOne(""+boardIdx));
		mav.setViewName("board/review_modify_form");
		return mav;
	}
	
		@RequestMapping("reviewUpdate.do")
	public ModelAndView reviewUpdate(BoardVo board, ContentsVo contents, @RequestParam("ufile") MultipartFile file, String img_idx){
		ModelAndView mav = new ModelAndView();
		
		BoardVo board2 = board;
		ContentsVo contents2 = contents;
		
		//게시판은 update
		boardService.updateReview(board2, contents2);
		System.out.println("너의 아이디는"+img_idx);
		imageService.updateReviewImg(board2, file, img_idx);
		
		mav.addObject("review",board2);
		mav.addObject("contents",contents2);
		mav.setViewName("redirect:reviewView.do?boardIdx="+board.getBoardIdx());
		
		return mav;
	}
		
		//review delete
	@RequestMapping("reviewDelete")
	public ModelAndView reviewDelete(String boardIdx){
		ModelAndView mav = new ModelAndView();
		
		boardService.deleteReview(boardIdx);
		imageService.deleteReview(boardIdx);
		
		mav.setViewName("redirect:reviewList.do");
		return mav;
	}



	@RequestMapping(value="commentsWrite.do")
	public ModelAndView commentsWrite(HttpSession session, CommentsVo comments,
										String parent_cm, String site, String b_writer,
											String b_code, int comment_pre_depth){
		ModelAndView mav = new ModelAndView();
		String mch_g_userid = (String) session.getAttribute("userid");
		commentsService.insertComments(comments, parent_cm);
		System.out.println("글 작성자? : "+b_writer+comments.getB_idx()+b_code);
		System.out.println(site);
		System.out.println(comment_pre_depth);
//		System.out.println("댓글이다 보드 코드 받아오니 : "+board_code);
		if(b_code.equals("g") && comment_pre_depth==0){
			System.out.println("메시지 오니");
			System.out.println("매칭 신청 됩니다.");
			MatchingVo matchingVo=new MatchingVo();
			matchingVo.setMch_t_userid(b_writer);
			matchingVo.setMch_g_userid(mch_g_userid);
			matchingVo.setB_idx(comments.getB_idx());
			System.out.println(matchingVo.toString());
			if(matchingService.matchingByb_idx(comments.getB_idx(), mch_g_userid)==null){
				matchingService.matchingSend(matchingVo);
				MessageVo messageVo=new MessageVo();
				messageVo.setMsg_send_userid(comments.getCm_writer());
				messageVo.setMsg_receive_userid(b_writer);
				messageVo.setMsg_contents("Start Matching");
				System.out.println(messageVo.toString());
				messageService.sendMessage(messageVo);
			}		
			
		
		}
		
		mav.setViewName("redirect:"+site+"View.do?boardIdx="+comments.getB_idx());
		return mav;
		
	}
	
	 
	
	
	@RequestMapping("commentsUpdate.do")
	public ModelAndView commentsUpdate(CommentsVo comments, String site){
		ModelAndView mav = new ModelAndView();
		commentsService.updateComments(comments);
		mav.setViewName("redirect:"+site+"View.do?boardIdx="+comments.getB_idx());
		return mav;
	}
	@RequestMapping("commentsDelete.do")
	public ModelAndView commentsDelete(CommentsVo comments, String site){
		ModelAndView mav = new ModelAndView();
		commentsService.deleteComments(comments.getCm_idx());
		mav.setViewName("redirect:"+site+"View.do?boardIdx="+comments.getB_idx());
		return mav;
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
}