package naver.jjhan1208.lrc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import naver.jjhan1208.lrc.domain.Sawon;

@Repository
public class SawonDao {
	@Autowired
	private SqlSession sqlSession;

	public String selectId(String id) {
		return sqlSession.selectOne("sawon.selectid", id);
	}

	public int registerUser(Sawon sawon) {
		return sqlSession.insert("sawon.insert", sawon);
	}

	public Sawon login(Sawon sawon) {
		return sqlSession.selectOne("sawon.login", sawon);
	}

}
