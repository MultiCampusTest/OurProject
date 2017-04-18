package tm.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.board.dao.IBoardDao;
import tm.board.dao.ICommentsDao;
import tm.board.dao.IContentsDao;
import tm.board.dao.IMapPositionDao;
import tm.image.dao.IImageDao;

@Service
public class BoardService {

	//
	@Autowired
	private IBoardDao boardGuideDao;
	
	@Autowired
	private ICommentsDao commenstDao;
	
	@Autowired
	private IContentsDao contentsDao;
	
	@Autowired
	private IImageDao imageDao;
	
	@Autowired
	private IMapPositionDao mapPositionDao;
	
	
}
