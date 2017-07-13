package digitalCanteenSSM.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Comment;
import digitalCanteenSSM.po.CommentItems;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.UserItems;
import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.CommentInWindowService;
import digitalCanteenSSM.service.WindowPresetService;

@Controller 
public class CommentInWindowController {
	
	@Autowired
	private CommentInWindowService commentService;
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private WindowPresetService windowPresetService;
	
	//查找一个档口下的所有评论
	@RequestMapping("/findAllCommentInWindow")
	public ModelAndView findAllCommentInWindow(HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		Integer wndID = (Integer)session.getAttribute("wndID");
		List<CommentItems> commentItemsList = commentService.findAllCommentsInWindow(wndID);
		modelAndView.addObject("commentItemsList",commentItemsList);
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		modelAndView.setViewName("/WEB-INF/jsp/commentInWindow.jsp");
		
		return modelAndView;
	}
	
	//后台管理员选择要查询评论的窗口
	@RequestMapping("/commentSelectWindow")
	public ModelAndView commentSelectWindow(HttpSession session) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList",windowPresetService.findAllWindows());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/commentMUserInquire.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_commentMUserInquire.jsp");
		}

		return modelAndView;
	}
		
	//后台管理员查询一个档口下的评论
	@RequestMapping("/commentMUserInquire")
	public ModelAndView commentMUserInquire(Integer wndID,HttpSession session) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList",windowPresetService.findAllWindows());
		
		List<CommentItems> commentItemsList = commentService.findAllCommentsInWindow(wndID);
		modelAndView.addObject("commentItemsList",commentItemsList);
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/commentMUserInquire.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_commentMUserInquire.jsp");
		}

		return modelAndView;
	}
	
	//转向添加评论页
	@RequestMapping("/addCommentInWindow")
	public ModelAndView addCommentInWindow(Integer wndID,HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		UserItems userItems = (UserItems)session.getAttribute("userItems");
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		modelAndView.addObject("userItems",userItems);
		modelAndView.setViewName("/WEB-INF/jsp/commentAdd.jsp");
		
		return modelAndView;
	}
		
	//插入评论
	@RequestMapping("/insertCommentInWindow")
	public ModelAndView insertCommentInWindow(Comment comment) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		Date date = new Date();
		comment.setCmtDate(date);		
		Window window = windowPresetService.findWindowById(comment.getCmtWndID());
		float score = window.getWndScore();
		List<CommentItems> commentItemsList = commentService.findAllCommentsInWindow(comment.getCmtWndID());
		window.setWndScore((score*commentItemsList.size()+comment.getCmtScore())/(commentItemsList.size()+1));
		
		windowPresetService.updateWindowScore(window);
		commentService.InsertCommentInWindow(comment);
		modelAndView.setViewName("findAllCommentInWindow.action");
		
		return modelAndView;
	}
	
	//点赞数
	@RequestMapping("/updateCmtGoodNum")
	public String updateCmtGoodNum(Integer cmtID,Integer cmtGood) throws Exception{
			
		
		Comment comment = commentService.findCommentByID(cmtID);
		comment.setCmtGoodNum(cmtGood);
		commentService.updateCommentGoodNum(comment);
		
		return null;
	}
	
	//删除评论
	@RequestMapping("/deleteCommentById")
	public ModelAndView deleteCommentById(Integer cmtID,Integer wndID,HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		commentService.deleteCommentById(cmtID);
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList",windowPresetService.findAllWindows());
		
		modelAndView.addObject("commentItemsList",commentService.findAllCommentsInWindow(wndID));
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/commentMUserInquire.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_commentMUserInquire.jsp");
		}

		return modelAndView;
	}
}
