package naver.jjhan1208.lrc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import naver.jjhan1208.lrc.dao.Job_AssignmentDao;
import naver.jjhan1208.lrc.dao.SawonDao;
import naver.jjhan1208.lrc.domain.Job_Assignment;


@RestController
public class JSONController {
	@Autowired
	private SawonDao sawonDao;
	
	@Autowired
	private Job_AssignmentDao job_AssignmentDao;
	
	@RequestMapping(value = "user/idcheck", method = RequestMethod.GET)
	public Map<String, Object> idcheck(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		String result = sawonDao.selectId(id);
		//System.out.println(result);
		if(result == null)
			map.put("result", "true");
		else
			map.put("result", "false");
		System.out.println(map);
		return map;
	}
	

	
	@RequestMapping(value = "job/getjob_separ_1", method = RequestMethod.GET)
	public List<Job_Assignment> getJob_Level_M(String space, Model model) {
		System.out.println(space);
		List<Job_Assignment> list = job_AssignmentDao.listSepar1(space);
		System.out.println(list);
		return list;
	}
	@RequestMapping(value = "job/changespace", method = RequestMethod.GET)
	public List<Job_Assignment> changeJob_Level_M(Job_Assignment job_Assingment, Model model) {
		System.out.println(job_Assingment);
		List<Job_Assignment> list = job_AssignmentDao.listSepar2(job_Assingment);
		System.out.println(list);
		return list;
	}
	
	
	@RequestMapping(value = "job/getjob_assignment", method = RequestMethod.GET)
	public Map<String, Object>  getJobAssingment(Job_Assignment job_Assignment,Model model) {
		System.out.println("파라미터:" + job_Assignment);
		Job_Assignment  data= job_AssignmentDao.getJobAssingment(job_Assignment);
		System.out.println("결과:" + data);
		Map<String, Object>map = new HashMap<String, Object>();
		if(data == null)
			map.put("result", "true");
		else
			map.put("result", "false");
		return map;
	}
	
}
