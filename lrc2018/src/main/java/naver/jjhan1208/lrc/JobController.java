package naver.jjhan1208.lrc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import naver.jjhan1208.lrc.dao.Job_AssignmentDao;
import naver.jjhan1208.lrc.domain.Job_Assignment;

@Controller
public class JobController {
	@Autowired
	private Job_AssignmentDao job_AssignmentDao;

	@RequestMapping(value = "job/main", method = RequestMethod.GET)
	public String jobmain(Model model) {
		List<Job_Assignment> list = job_AssignmentDao.listJobAssingment();
		model.addAttribute("list", list);
		return "job/main";
	}
	
	@RequestMapping(value = "job/insertjob", method = RequestMethod.GET)
	public String insertjob(Model model) {
		return "job/insertjob";
	}
	
	@RequestMapping(value = "job/insertjob", method = RequestMethod.POST)
	public String insertjob(Job_Assignment job_Assignment, Model model, RedirectAttributes attr) {
		job_AssignmentDao.insertJobAssingment(job_Assignment);
		attr.addFlashAttribute("jobmsg","작업이 등록되었습니다.");
		return "redirect:/";
	}
	
	@RequestMapping(value = "job/deletejob", method = RequestMethod.GET)
	public String deletejob(int num, Model model, RedirectAttributes attr) {
		job_AssignmentDao.deleteJobAssingment(num);
		attr.addFlashAttribute("jobmsg","작업이 삭제되었습니다.");
		return "redirect:main";
	}
}
