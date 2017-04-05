package tm.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.member.dao.IMemberDao;

@Service
public class MemberService {
	
	@Autowired
	private IMemberDao memberDao;
	
}
