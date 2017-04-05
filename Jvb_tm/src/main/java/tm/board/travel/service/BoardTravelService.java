package tm.board.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.board.travel.dao.IBoardTravelDao;

@Service
public class BoardTravelService {
	
	@Autowired
	private IBoardTravelDao boardTravelDao;
}
