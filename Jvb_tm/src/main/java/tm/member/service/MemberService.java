package tm.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import tm.member.dao.IMemberDao;

public class MemberService {
	
	@Autowired
	private IMemberDao mDao;
}
