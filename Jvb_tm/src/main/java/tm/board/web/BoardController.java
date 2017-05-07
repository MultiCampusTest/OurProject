 package tm.board.web;
 
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView noticeList(HttpServletRequest req, @RequestParam(defaultValue="1") int page ) {
		String id = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getNoticeBoardList(page));
		mav.addObject("userid", id);
		mav.setViewName("board/notice_list");
		return mav;
	}
	
	@RequestMapping("noticeView.do")
	public ModelAndView noticeView(HttpServletRequest req, int boardIdx) {
		String id = (String)(req.getSession().getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.readNotice(boardIdx));
		mav.addObject("userid", id);
		mav.addObject("comments",commentsService.selectComments(boardIdx));
		mav.setViewName("board/notice_view");
		
		return mav;
	}

	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm() {
		return "board/notice_write_form";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="noticeWrite.do")
	public String noticeWrite(BoardVo board, ContentsVo contents){
		boardService.insertNotice(board, contents);
		return "redirect:noticeList.do";
	}
	
	@RequestMapping("noticeModifyForm.do")
	public ModelAndView noticeModifyForm(int boardIdx) {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getNotice(boardIdx));
		mav.setViewName("board/notice_modify_form");
		return mav;		
	}

	@RequestMapping(method=RequestMethod.POST, value="noticeModify.do")
	public String noticeModify(BoardVo board, ContentsVo contents){
		boardService.updateNotice(board, contents);
		return "redirect:noticeView.do?boardIdx="+board.getBoardIdx();
	}
	
	@RequestMapping("commentsWrite.do")
	public ModelAndView commentsWrite(CommentsVo comments){
		ModelAndView mav = new ModelAndView();
		commentsService.insertComments(comments);
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
		commentsService.deleteComments(comments);
		mav.setViewName("redirect:noticeView.do?boardIdx="+comments.getB_idx());
		return mav;
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
	@RequestMapping("guideWriteForm.do")
	public String guideWriteForm() {
		return "board/guide_write_form";
	}
	
	@RequestMapping("guideWrite.do")
	public String guideWrite(HttpServletRequest req, BoardVo board){
//		System.out.println(board.getLocCategory());
//		System.out.println(board.getSubCategory());

		return "board/guide_view";
	}

	@RequestMapping("guideList.do")
	public String guideList() {
		return "board/guide_list";
	}

	@RequestMapping("guideModifyForm.do")
	public String guideModifyForm() {
		return "board/guide_modify_form";
	}

	@RequestMapping("guideView.do")
	public String guideView() {
		return "board/guide_view";
	}

	// review_board
	@RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm() {
		return "board/review_write_form";
	}

	@RequestMapping("reviewList.do")
	public String reviewList() {
		return "board/review_list";
	}

	@RequestMapping("reviewView.do")
	public String reviewView() {
		return "board/review_view";
	}

	@RequestMapping("reviewModifyForm.do")
	public String reviewModifyForm() {
		return "board/review_modify_form";
	}

	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
}
