package java.dao.memberdao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDao implements IMemberDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Override
	public HashMap<String, Object> loginCheck(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> getId(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> getPwd(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> idCheck(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> selectOne(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> deletePwdCheck(String userid) {
//		 TODO Auto-generated method stub
		return null;
	}
	
}