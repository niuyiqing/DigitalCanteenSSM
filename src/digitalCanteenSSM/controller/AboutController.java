package digitalCanteenSSM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController {
	@RequestMapping("/aboutPage")
	public ModelAndView aboutPage() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/WEB-INF/jsp/m_aboutPage.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/sharePage")
	public ModelAndView sharePage()throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/WEB-INF/jsp/m_sharePage.jsp");
		
		return modelAndView;
	}
	
}
