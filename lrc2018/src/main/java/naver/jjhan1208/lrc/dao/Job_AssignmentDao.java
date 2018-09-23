package naver.jjhan1208.lrc.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import naver.jjhan1208.lrc.domain.Job_Assignment;

@Repository
public class Job_AssignmentDao {

	@Autowired
	private SqlSession sqlSession;

	public List<Job_Assignment> listJobAssingment() {
		return sqlSession.selectList("job.listjob");
	}

	public Job_Assignment getJobAssingment(Job_Assignment job_Assignment) {
		return sqlSession.selectOne("job.getjob", job_Assignment);
	}

	public int insertJobAssingment(Job_Assignment job_Assignment) {
		System.out.println("dao:" + job_Assignment);
		return sqlSession.insert("job.insertjob", job_Assignment);
	}

	public int deleteJobAssingment(int num) {
		return sqlSession.delete("job.deletejob", num);
	}

	public int updateJobAssingment(Job_Assignment job_Assignment) {
		return sqlSession.delete("job.updatejob", job_Assignment);
	}

	public List<String> listSpace() {
		return sqlSession.selectList("job.listspace");
	}

	public List<Job_Assignment> listSepar1(String space) {
		return sqlSession.selectList("job.listsepar1", space);
	}

	public List<Job_Assignment> listSepar2(Job_Assignment job_Assignment) {
		return sqlSession.selectList("job.listsepar2", job_Assignment);
	}

}
