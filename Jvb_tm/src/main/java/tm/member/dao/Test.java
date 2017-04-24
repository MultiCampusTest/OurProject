package tm.member.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import tm.member.vo.MemberVo;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebContent/WEB-INF/rootContext.xml");
		IMemberDao memberDao = context.getBean("memberDao", IMemberDao.class);
		MemberVo memberVo = new MemberVo();
		memberVo.setUserid("admin");
		memberVo.setPwd("12345");
		memberVo.setEmail("example@domain.com");
		memberVo.setBirthday("2017-04-20");
		memberVo.setNationality("KR");
		memberVo.setGender("male");
		memberVo.setIntroduce("Hello");
		memberDao.insertMember(memberVo);
	}
}