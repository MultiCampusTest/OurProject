package tm.board.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import tm.board.review.dao.IBoardReviewDao;

@Service
public class BoardReviewService {
	
	@Autowired
	private IBoardReviewDao boardReviewDao;
}
