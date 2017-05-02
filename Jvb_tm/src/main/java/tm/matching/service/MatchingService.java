package tm.matching.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.matching.dao.IMatchingDao;

@Service
public class MatchingService {

	@Autowired
	private IMatchingDao matchingDao;

	// singletone
	private static MatchingService instance;

	public static MatchingService getInstance() {
		if (instance == null) {
			instance = new MatchingService();
			return instance;
		}
		return instance;
	}
	
	
	

}
