package tm.comments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.comments.dao.ICommentsDao;

@Service
public class CommentsService {

	@Autowired
	private ICommentsDao commentsDao;
}
