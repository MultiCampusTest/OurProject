package tm.member.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import tm.member.vo.MemberVo;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebContent/WEB-INF/rootContext.xml");
		IMemberDao dao = context.getBean("memberDao", IMemberDao.class);
		
		MemberVo m = new MemberVo();

		//insert test
//		m.setUserid("tester");
//		m.setPwd("1234");
//		m.setF_name("first");
//		m.setL_name("last");
//		m.setEmail("example@domain.com");
//		m.setBirthday("2015-05-01");
//		m.setCountry("KR");
//		m.setGender("female");
//		m.setIntroduce("Hello");
		
		//update test
//		m.setPwd("1234");
//		m.setEmail("email");
//		m.setBirthday("2000-02-02");
//		m.setCountry("UK");
//		m.setIntroduce("Hi");
//		m.setUserid("admin");
//		dao.memberUpdate(m);
		
		
		//delete test
//		m.setUserid("admin");
//		m.setPwd("1234");
//		dao.memberDelete(m);
		
		//selectOne test
//		System.out.println(dao.memberSelectOne("admin"));
		
	}
}
