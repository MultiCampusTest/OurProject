package tm.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tm.board.service.BoardService;
import tm.board.vo.BoardVo;
import tm.board.vo.ContentsVo;

@Controller
public class BoardController {
	  
	@Autowired
	private BoardService boardService;
	
	//메인화면
	@RequestMapping("main.do")
	public String main() {
		return "middle";
	}

	// notice_board
	@RequestMapping("noticeList.do")
	public String noticeList() {
		return "board/notice_list";
	}
	
	@RequestMapping("noticeView.do")
	public String noticeView() {
		return "board/notice_view";
	}

	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm() {
		return "board/notice_write_form";
	}

	@RequestMapping("noticeModifyForm.do")
	public String noticeModifyForm() {
		return "board/notice_modify_form";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="noticeWrite.do")
	public String noticeWrite(BoardVo board, ContentsVo contents){
	
		boardService.writeBoard(board, contents);
		return "redirect:noticeList.do";
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

}
