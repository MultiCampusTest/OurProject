 package tm.board.web;
 
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import tm.board.service.BoardService;
import tm.board.service.CommentsService;
import tm.board.vo.BoardVo;
import tm.board.vo.CommentsVo;
import tm.board.vo.ContentsVo;

@Controller
public class BoardController {
	  
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentsService commentsService;
	
	//메인화면
	@RequestMapping("main.do")
	public String main() {
		return "middle";
	}

	// notice_board
	@RequestMapping("noticeList.do")
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
	
	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm() {
		return "board/notice_write_form";
	}
	
	@RequestMapping(value="noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite(BoardVo board, ContentsVo contents){
		boardService.insertNotice(board, contents);
		return "redirect:noticeView.do?boardIdx="+board.getBoardIdx();
	}
	
	@RequestMapping("noticeView.do")
	public ModelAndView noticeView(HttpServletRequest req, int boardIdx) {
		String userid = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.readNotice(boardIdx));
		mav.addObject("userid", userid);
//		mav.addObject("comments",commentsService.selectComments(boardIdx)); 
		mav.setViewName("board/notice_view");
		
		return mav;
	}
	
	@RequestMapping("noticeModifyForm.do")
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
	@RequestMapping("travelList.do")
	public String travelList() {
		return "board/travel_list";
	}

	@RequestMapping("travelWriteForm.do")
	public String travelWriteForm() {
		return "board/travel_write_form";
	}

	@RequestMapping("travelView.do")
	public String travelView() {
		return "travelList";
	}

	@RequestMapping("travelModifyForm.do")
	public String travelModifyForm() {
		return "travelList";
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
	
	@RequestMapping("guideWrite.do")
	public String guideWrite(
			HttpServletRequest req, BoardVo board,
			ContentsVo contents
			){
		
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
//		mav.addObject("comments",commentsService.selectComments(boardIdx)); 
		mav.setViewName("board/guide_view");

		return mav;
	}

	@RequestMapping("guideModifyForm.do")
	public String guideModifyForm() {
		return "board/guide_modify_form";
	}


	// review_board
	@RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm() {
		return "board/review_write_form";
	}
	
	@RequestMapping("reviewWrite.do")
	@ResponseBody
	public ModelAndView reviewWrite(BoardVo board, ContentsVo contents, MultipartHttpServletRequest req) {
		boardService.insertReview(board, contents, req);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:reviewView.do?boardIdx="+board.getBoardIdx());
		return mav;
	}

	@RequestMapping("reviewList.do")
	public ModelAndView reviewList(HttpServletRequest req, @RequestParam(defaultValue="1") int page, String searchValue) {
		String code = "r";
		String userid = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getReviewBoardList(code, page, searchValue));
		mav.addObject("userid", userid);
		mav.setViewName("board/review_list");
		return mav;
	}

	@RequestMapping("reviewView.do")
	public String reviewView() {
		return "board/review_view";
	}

	@RequestMapping("reviewModifyForm.do")
	public String reviewModifyForm() {
		return "board/review_modify_form";
	}


	@RequestMapping("commentsWrite.do")
	public ModelAndView commentsWrite(CommentsVo comments, String parent_cm){
		ModelAndView mav = new ModelAndView();
		commentsService.insertComments(comments, parent_cm);
		mav.setViewName("redirect:noticeView.do?boardIdx="+comments.getB_idx());
		return mav;
	}
	@RequestMapping("commentsUpdate.do")
	public ModelAndView commentsUpdate(CommentsVo comments){
		ModelAndView mav = new ModelAndView();
		commentsService.updateComments(comments);
		mav.setViewName("redirect:noticeView.do?boardIdx="+comments.getB_idx());
		return mav;
	}
	@RequestMapping("commentsDelete.do")
	public ModelAndView commentsDelete(CommentsVo comments){
		ModelAndView mav = new ModelAndView();
		commentsService.deleteComments(comments.getCm_idx());
		mav.setViewName("redirect:noticeView.do?boardIdx="+comments.getB_idx());
		return mav;
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
}
