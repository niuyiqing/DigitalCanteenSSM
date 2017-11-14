package digitalCanteenSSM.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.po.WindowItems;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.UploadFileService;
import digitalCanteenSSM.service.WindowPresetService;


@Controller
public class WindowPresetController {
	
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private WindowPresetService windowPresetService;
	@Autowired
	private UploadFileService uploadFileService;
	
	//档口预置页面
	//添加档口按钮与已添加档口显示
	@RequestMapping ("/windowPreset")
	public String windowPreset() throws Exception{
		
		return "forward:findAllWindows.action";
	}
	
	//查找所有档口
	//返回档口预置页面显示
	@RequestMapping ("/findAllWindows")
	public ModelAndView findAllWindows(Integer cantCampusID, HttpServletRequest request, HttpSession session) throws Exception{
		//本段代码运行时优先从request中读取的页码和单页内容数量，
		//如果请求从其它controller发出，并无这两个对象，
		//则使用的是默认的值
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = 1;
		int size = 10;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		
		//配置pagehelper的排序及分页
		String sortString = "id.desc";
		Order.formString(sortString);
		PageHelper.startPage(num, size);
		
		List<WindowItems> windowItemsList = windowPresetService.findAllWindows();
		PageInfo<WindowItems> pagehelper = new PageInfo<WindowItems>(windowItemsList);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("pagehelper", pagehelper);
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/windowPreset.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_windowPreset.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/manageWindows")
	public ModelAndView manageWindows() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		return modelAndView;
	}
	
	//通过档口ID查找档口信息
	@RequestMapping ("/findWindowById")
	public WindowItems findWindowById(Integer wndID) throws Exception{
		
		return windowPresetService.findWindowById(wndID);
	}
		
	//修改档口：跳转到windowModify.jsp显示具体修改信息
	@RequestMapping ("/modifyWindow")	
	public ModelAndView modifyWindow(Integer wndID, Integer cantCampusID, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("canteenItemsInCampus",canteenPresetService.findCanteenByCampus(cantCampusID));
		modelAndView.addObject("windowItems",findWindowById(wndID));	
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/windowModify.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_windowModify.jsp");
		}
		
		return modelAndView;
	}
	
	//修改档口：修改之后保存并跳转到档口预置页面
	@RequestMapping ("/modifyWindowSave")	
	public String modifyWindowSave(WindowItems windowItems, MultipartFile wndPhotoFile) throws Exception{
		
		if(findWindowByName(windowItems) == null || findWindowByName(windowItems).getWndID() == windowItems.getWndID()){
			
			String wndphoto = uploadFileService.uploadFile(wndPhotoFile, DishManagementController.getPicturepath());
			//未改变图片则用原来的
			if(wndphoto == null){
				windowItems.setWndPhoto(windowPresetService.findWindowById(windowItems.getWndID()).getWndPhoto());
			}else{
				windowItems.setWndPhoto(wndphoto);
			}
			
			windowPresetService.updateWindow(windowItems);
		}	
		
		return "forward:windowPreset.action";	
	}
		
	//通过档口ID删除档口信息
	@RequestMapping ("/deleteWindowById")
	public String deleteWindowById(Window window) throws Exception{
		
		windowPresetService.deleteWindowById(window);
		
		return "forward:windowPreset.action";
	}
	
	//通过档口Name查找档口信息供插入档口信息时检查
	private WindowItems findWindowByName(WindowItems windowItems) throws Exception {
		
		return windowPresetService.findWindowByName(windowItems);
	}
		
	//插入新档口信息
	@RequestMapping ("/insertWindow")
	public String insertWindow(WindowItems windowItems, MultipartFile wndPhotoFile) throws Exception{
				
		if(findWindowByName(windowItems) == null){
			String wndphoto = uploadFileService.uploadFile(wndPhotoFile, DishManagementController.getPicturepath());
			//未输入图片则使用默认的
			if(wndphoto == null){
				windowItems.setWndPhoto(DishManagementController.getWndDefaultpicturepath());
			}else{
				windowItems.setWndPhoto(wndphoto);
			}
			
			windowPresetService.insertWindow(windowItems);
		}
		
		return "forward:windowPreset.action";	
	}
		
}


