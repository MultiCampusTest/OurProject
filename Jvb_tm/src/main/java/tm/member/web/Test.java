package tm.member.web;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import tm.member.dao.IMemberDao;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebContent/WEB-INF/rootContext.xml");
		IMemberDao dao = context.getBean("memberDao", IMemberDao.class);
		
		System.out.println(dao.memberSelectOne("sejeong"));
	}
}
