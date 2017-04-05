package tm.board.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.board.notice.dao.IBoardNoticeDao;



@Service
public class BoardNoticeService {

	@Autowired
	private IBoardNoticeDao boardNoticeDao;
	
}
