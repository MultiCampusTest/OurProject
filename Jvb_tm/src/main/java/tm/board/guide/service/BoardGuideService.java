package tm.board.guide.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.board.guide.dao.IBoardGuideDao;

@Service
public class BoardGuideService {

	@Autowired
	private IBoardGuideDao boardGuideDao;
	
	
}
