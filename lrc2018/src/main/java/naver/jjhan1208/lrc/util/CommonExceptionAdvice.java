package naver.jjhan1208.lrc.util;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("naver.jjhan1208.lrc")
public class CommonExceptionAdvice {

	@ExceptionHandler(Exception.class)
	private ModelAndView errorModelAndView(Exception ex) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/error/error");
		System.out.println( ex.getMessage());
		ex.printStackTrace();

		return modelAndView;
	}
}

