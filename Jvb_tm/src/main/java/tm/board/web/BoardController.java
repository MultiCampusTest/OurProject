package tm.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("main.do")
	public String main() {
		return "middle";
	}

	@RequestMapping("myPage.do")
	public String maindo() {
		return "myPage";
	}

	// notice
	@RequestMapping("noticeList.do")
	public String noticeList() {
		return "noticeList";
	}

	@RequestMapping("noticeView.do")
	public String noticeView() {
		return "noticeView";
	}

	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm() {
		return "noticeWriteForm";
	}

	@RequestMapping("noticeModifyForm.do")
	public String noticeModifyForm() {
		return "noticeModifyForm";
	}

	// travel
	@RequestMapping("travelList.do")
	public String travelList() {
		return "travelList";
	}

	@RequestMapping("travelWriteForm.do")
	public String travelWriteForm() {
		return "travelWriteForm";
	}

	@RequestMapping("travelView.do")
	public String travelView() {
		return "travelList";
	}

	@RequestMapping("travelModifyForm.do")
	public String travelModifyForm() {
		return "travelList";
	}

	// guide
	@RequestMapping("guideWriteForm.do")
	public String guideWriteForm() {
		return "guideWriteForm";
	}

	@RequestMapping("guideList.do")
	public String guideList() {
		return "guideList";
	}

	@RequestMapping("guideModifyForm.do")
	public String guideModifyForm() {
		return "guideModifyForm";
	}

	@RequestMapping("guideView.do")
	public String guideView() {
		return "guideView";
	}

	// review
	@RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm() {
		return "reviewWriteForm";
	}

	@RequestMapping("reviewList.do")
	public String reviewList() {
		return "reviewList";
	}

	@RequestMapping("reviewView.do")
	public String reviewView() {
		return "reviewView";
	}

	@RequestMapping("reviewModifyForm.do")
	public String reviewModifyForm() {
		return "reviewModifyForm";
	}

}
