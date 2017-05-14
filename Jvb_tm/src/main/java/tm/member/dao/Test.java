package tm.member.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import tm.member.vo.MemberVo;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebContent/WEB-INF/rootContext.xml");
		IMemberDao dao = context.getBean("memberDao", IMemberDao.class);
		MemberVo m = new MemberVo();
		m.setUserid("a@a.com");
		m.setPwd("1234");
		dao.passwordReset(m);
	}
}