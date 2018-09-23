package naver.jjhan1208.lrc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import naver.jjhan1208.lrc.dao.Job_AssignmentDao;
import naver.jjhan1208.lrc.dao.SawonDao;
import naver.jjhan1208.lrc.domain.Job_Assignment;
import naver.jjhan1208.lrc.domain.Sawon;

@Controller
public class UserController {
	@Autowired
	private SawonDao sawonDao;
	@Autowired
	private Job_AssignmentDao job_AssignmentDao;

	@RequestMapping(value = "user/register", method = RequestMethod.GET)
	public void register() {
	}

	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public String register(Sawon sawon, RedirectAttributes rttr) {
		sawonDao.registerUser(sawon);
		rttr.addFlashAttribute("insert", "true");	
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "user/login", method = RequestMethod.GET)
	public void login(){}
	
	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	public String login(Sawon sawon, HttpSession session, RedirectAttributes attr) {
		Sawon user = sawonDao.login(sawon);
		if (user == null) {
			attr.addFlashAttribute("msg", "없는 아이디이거나 비밀번호가 잘못되었습니다.");
			return "redirect:login";
		}
		session.setAttribute("user", user);
		System.out.println(user);
		List<Job_Assignment> list = job_AssignmentDao.listJobAssingment();
		session.setAttribute("list", list);
		
		List<String> space = job_AssignmentDao.listSpace();
		session.setAttribute("space", space);
		return "redirect:/";
	}
	
	@RequestMapping(value = "user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}
