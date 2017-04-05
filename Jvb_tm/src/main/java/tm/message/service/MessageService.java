package tm.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.message.dao.IMessageDao;

@Service
public class MessageService {

	@Autowired
	private IMessageDao messageDao;
}
