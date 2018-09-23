package naver.jjhan1208.lrc;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import naver.jjhan1208.lrc.dao.Job_AssignmentDao;
import naver.jjhan1208.lrc.domain.Job_Assignment;


@Controller
public class HomeController {
	@Autowired
	private Job_AssignmentDao job_AssignmentDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<Job_Assignment> list = job_AssignmentDao.listJobAssingment();
		model.addAttribute("list", list);
		List<String> space = job_AssignmentDao.listSpace();
		model.addAttribute("space", space);
		return "home";
	}
	
}
