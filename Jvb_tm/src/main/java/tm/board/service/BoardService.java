package tm.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.board.dao.IBoardDao;

@Service
public class BoardService {

	//
	@Autowired
	private IBoardDao boardGuideDao;
	
	
	
}
